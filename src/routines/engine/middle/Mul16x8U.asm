Mul16x8U:							; X (16 bits) * A (8 bits) into r2, unsigned
	phy
	tay
	beq Mul16x8_Zero
	txa
	beq Mul16x8_Zero
Mul16x8U_go:						; entry used by the routines after it
	stz.b r2+2
	sep #$20
	sta.l WRMPYA
	tya
	sta.l WRMPYB
	xba
	sta.l WRMPYA
	rep #$21
	lda.l RDMPYL
	sta.b r2
	tax
	tya
	sta.l WRMPYB
	lda.b r2+1
	adc.l RDMPYL
	sta.b r2+1
	ply
	rtl
