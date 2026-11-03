RenderThinCentred:					; render centred packed text in the thin font
	jsl.l UnpackText
	lda.w #$0005
	sta.b $0E
	lda.w #ThinFontGlyphs&$FFFF
	sta.b $0C
	phy
	jsl.l CentreText
	jsl.l DrawText
	ply
	rtl
