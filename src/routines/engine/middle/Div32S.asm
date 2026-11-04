Div32S:								; r2 (4 bytes) / r1 into r0, signed; $7FFF if it does not fit
	lda.b r1
	bmi .divneg
	lda.b r2+2
	bmi .dividendneg
	jmp.w Div32U
.divneg:							; divisor negative
	eor.w #$FFFF
	inc a
	sta.b r1
	lda.b r2+2
	bpl .negate
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
	jmp.w Div32U
.dividendneg:						; dividend negative
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
.negate:							; one of them negative: negate the quotient
	jsl.l Div32U
	lda.w #$0000
	sec
	sbc.b r0
	sta.b r0
	rtl
