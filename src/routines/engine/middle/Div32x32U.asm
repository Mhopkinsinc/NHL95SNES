Div32x32U:							; r2 (4 bytes) / r1 (4 bytes) into r0, remainder in r2, unsigned
	phx
	phy
	stz.b r0
	stz.b r0+2
	ldy.w #$0000
	lda.b r1+2
	bmi .loop
.norm:								; shift the divisor up to bit 31
	iny
	asl.b r1
	rol.b r1+2
	bpl .norm
.loop:								; one quotient bit
	lda.b r2
	sec
	sbc.b r1
	tax
	lda.b r2+2
	sbc.b r1+2
	bcc .bit
	stx.b r2
	sta.b r2+2
.bit:								; the bit into r0
	rol.b r0
	rol.b r0+2
	lsr.b r1+2
	ror.b r1
	dey
	bpl .loop
	ply
	plx
	rtl
