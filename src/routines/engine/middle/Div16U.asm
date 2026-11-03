Div16U:								; r2 / r1 into r0, unsigned
	sep #$20
Div16U_Go:							; entry used by the routines after it
	lda.b r1+1
	beq Div16x8U_Go
	stz.b r2+2
	lda.b r2+1
	cmp.b r1+1
	bcs Div_8Bits
	rep #$20
	stz.b r0
	rtl
