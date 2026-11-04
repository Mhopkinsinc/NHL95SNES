RenderItalicCentredROMStr:			; render a centred ROM string in the italic font
	jsl.l CopyROMString
DrawItalicCentredBuffer:			; draw the prepared text buffer centred in the italic font
	lda.w #$0003
	sta.b $0E
	lda.w #ItalicFontGlyphs&$FFFF
	sta.b $0C
	phy
	jsl.l CentreText
	jsl.l DrawText
	ply
	rtl
