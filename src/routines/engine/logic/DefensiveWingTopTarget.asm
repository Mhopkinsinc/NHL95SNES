DefensiveWingTopTarget:				; choose the defensive wing target depth at the top end
	lda.w #$00A2
	sta.b d1
	lda.w #$0052
	sta.b d2
	lda.w position,y
	beq DefensiveWingUseLimit
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne DefensiveWingUseLimit
	lda.b d2
	sec
	sbc.w pucky
	bmi .1
	lda.w pucky
	sta.b d1
	bra DefensiveWingSkate
.1:									; d2 = $010E, A - pucky, if the result >= 0 go to DefensiveWingSkate
	lda.w #$010E
	sta.b d2
	sec
	sbc.w pucky
	bpl DefensiveWingSkate
DefensiveWingUseLimit:				; use the selected depth limit as the defensive wing target
	lda.b d2
	sta.b d1
DefensiveWingSkate:					; finish the defensive wing lateral target and skate there
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	lda.w puckx
	eor.b d0
	sta.b d2
	bmi .1
	lda.w puckx
	sta.b d0
.1:									; go to skateto
	jmp.w skateto
