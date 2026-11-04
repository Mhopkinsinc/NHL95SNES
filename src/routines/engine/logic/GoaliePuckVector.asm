GoaliePuckVector:					; called from other segments
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bra AdjustGoalieVectorAtNet
.1:									; no caller found: d0 = puckx, d1 = pucky - d4, then the next routine
	lda.w puckx
	sta.b d0
	lda.w pucky
	sec
	sbc.b d4
	sta.b d1
AdjustGoalieVectorAtNet:			; adjust the puck vector when the puck lies behind the goal line
	lda.w Ypos,x
	bpl .3
	cmp.w #$FEF2
	bmi .rts
	lda.w pucky
	cmp.w #$FEF2
	bmi .1
	rts
.1:									; d1 = $0001, return
	lda.w #$0001
	sta.b d1
	rts
.2:									; d1 = $FFFF
	lda.w #$FFFF
	sta.b d1
.rts:								; return
	rts
.3:									; if A - $010E >= 0 go to .rts, if pucky - $010E >= 0 go to .2, return
	cmp.w #$010E
	bpl .rts
	lda.w pucky
	cmp.w #$010E
	bpl .2
	rts
