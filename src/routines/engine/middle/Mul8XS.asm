Mul8XS:								; A * X, 8 by 8 bits, X signed, into A
	cpx.w #$0000
	bpl Mul8U
	sep #$21
	sta.l WRMPYA
	txa
	eor.b #$FF
	inc a
	sta.l WRMPYB
	rep #$20
	lda.w #$0000
	sbc.l RDMPYL
	rtl
