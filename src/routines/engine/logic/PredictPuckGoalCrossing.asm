PredictPuckGoalCrossing:			; predict puck crossing time and X at the goal line in d4
	lda.b d4
	sec
	sbc.w pucky
	sta.b d0
	lda.w puckvy
	beq PuckCrossingInvalidJump
	eor.b d0
	bmi PuckCrossingInvalidJump
	lda.b d0
	stz.b r2
	lsr a
	ror.b r2
	lsr a
	ror.b r2
	lsr a
	ror.b r2
	lsr a
	ror.b r2
	bit.w #$0800
	beq .1
	ora.w #$F000
.1:									; r2+2 = A, r1 = puckvy, call Div32S, puckcross+2,y = r0, ...
	sta.b r2+2
	lda.w puckvy
	sta.b r1
	jsl.l Div32S
	lda.b r0
	sta.w puckcross+2,y
	lda.b r0
	asl a
	asl a
	asl a
	asl a
	ldx.w puckvx
	jsl.l Mul16XS
	adc.w puckx
	sta.b d0
	cmp.w #$009B
	bmi .2
	lda.w #$009B
	sta.b d0
.2:									; if d0 - $FF65 >= 0 go to .3, d0 = $FF65
	lda.b d0
	cmp.w #$FF65
	bpl .3
	lda.w #$FF65
	sta.b d0
.3:									; puckcross,y = d0, return
	lda.b d0
	sta.w puckcross,y
	rtl
