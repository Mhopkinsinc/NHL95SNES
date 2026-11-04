CenterDefenceTopTarget:				; adjust the defensive center target toward the puck at the top end
	lda.w #$005C
	sec
	sbc.w pucky
	bmi CenterDefenceSkate
	lda.b d1
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
CenterDefenceSkate:					; skate the defensive center toward d0 and d1 with an empty callback
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jmp.w skateto
