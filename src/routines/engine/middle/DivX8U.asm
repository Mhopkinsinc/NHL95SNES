DivX8U:								; X / A (8 bits) into A with the hardware divider
	pha
	txa
	sta.l WRDIVL
	pla
	sep #$20
	sta.l WRDIVB
	rep #$20
	phx
	plx
	lda.l RDDIVL
	rtl
