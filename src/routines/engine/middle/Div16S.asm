Div16S:								; r2 / r1 into r0, signed
	lda.b r1
	bmi .divneg
	lda.b r2
	bmi .dividendneg
	jmp.w Div16U
.divneg:							; divisor negative
	eor.w #$FFFF
	inc a
	sta.b r1
	lda.b r2
	bpl .negate
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	jmp.w Div16U
.dividendneg:						; dividend negative
	eor.w #$FFFF
	inc a
	sta.b r2
.negate:							; one of them negative: negate the quotient
	jsl.l Div16U
	lda.w #$0000
	sec
	sbc.b r0
	sta.b r0
	rtl
