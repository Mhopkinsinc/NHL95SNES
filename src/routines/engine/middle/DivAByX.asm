DivAByX:							; A = A / X (X 8-bit) by the divider registers, X = the remainder
	sta.l WRDIVL
	sep #$20
	txa
	sta.l WRDIVB
	rep #$20
	pha
	xba
	pla
	lda.l RDMPYL
	tax
	lda.l RDDIVL
	rtl
