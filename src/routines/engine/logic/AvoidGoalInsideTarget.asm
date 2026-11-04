AvoidGoalInsideTarget:				; adjust an inside-box target for crossing the goal line or goalie
	ldx.b curobj
	lda.b p0+2
	cmp.w #$FEF2
	bpl .1
	lda.b p1+2
	cmp.w #$FEF2
	bmi .rts
	bra AvoidGoalFromBehind
.1:									; if p1+2 - $FEF2 < 0 go to .3, if $44 < 0 go to .rts, ...
	lda.b p1+2
	cmp.w #$FEF2
	bmi .3
	ldy.b $44
	bmi .rts
	lda.b p0
	cmp.b p1
	bmi .2
	cmp.w Xpos,y
	bmi .rts
	lda.b $42
	sta.b d1
.rts:								; return
	rts
.2:									; if A - Xpos,y >= 0 go to .rts2, d1 = $42
	cmp.w Xpos,y
	bpl .rts2
	lda.b $42
	sta.b d1
.rts2:								; return
	rts
.3:									; d1 = $42, go to AvoidGoalCrossGoalie
	lda.b $42
	sta.b d1
	bra AvoidGoalCrossGoalie
