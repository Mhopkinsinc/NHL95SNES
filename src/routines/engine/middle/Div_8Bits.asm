Div_8Bits:							; r2+1 (with r2) / r1 when the quotient fits in 8 bits
	stz.b r0
	rep #$20
	lda.b r2+1
	ldx.w #$0008
.loop:								; one quotient bit
	asl.b r1+3
	rol a
	bcs .sub
	cmp.b r1
	bcc .bit
.sub:								; subtract
	sbc.b r1
	sec
.bit:								; the bit into r0
	rol.b r0
	dex
	bne .loop
	rtl
