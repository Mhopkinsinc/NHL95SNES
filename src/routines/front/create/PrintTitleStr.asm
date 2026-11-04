PrintTitleStr:						; PrintTitle for the string X in RAM
	pei ($D5)
	lda.w #$2400
	sta.b $D5
	phy
	jsl.l PrintItalicLeftStr
	ply
	iny
	iny
	ldx.w #$2800
	stx.b $D5
	jsl.l PrintTitleBar
	pla
	sta.b $D5
	rtl
