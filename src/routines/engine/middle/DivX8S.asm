DivX8S:								; X / A (8 bits) into A, X signed
	cpx.w #$0000
	bpl DivX8U
	phy
	tay
	txa
	eor.w #$FFFF
	inc a
	sta.l WRDIVL
	sep #$20
	tya
	sta.l WRDIVB
	rep #$20
	ply
	lda.w #$0000
	sec
	sbc.l RDDIVL
	rtl
