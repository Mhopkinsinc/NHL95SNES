PrintTitle:							; prints the packed text X at row Y as a title: PrintItalicLeft with the
									; map bits $2400, then PrintTitleBar under it (map bits $2800)
	pei ($D5)
	lda.w #$2400
	sta.b $D5
	phy
	jsl.l PrintItalicLeft
	ply
	iny
	iny
	ldx.w #$2800
	stx.b $D5
	jsl.l PrintTitleBar
	pla
	sta.b $D5
	rtl
