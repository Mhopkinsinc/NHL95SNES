Mul8U:								; A * X, 8 by 8 bits, unsigned, into A
	sep #$20
	sta.l WRMPYA
	txa
	sta.l WRMPYB
	rep #$20
	nop
	lda.l RDMPYL
	rtl
