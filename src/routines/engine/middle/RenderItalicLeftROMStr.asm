RenderItalicLeftROMStr:				; render a left-aligned ROM string in the italic font
	jsl.l CopyROMString
DrawItalicLeftBuffer:				; draw the prepared text buffer from the left margin in the italic font
	lda.w #$0003
	sta.b $0E
	lda.w #ItalicFontGlyphs&$FFFF
	sta.b $0C
	phy
	lda.b $CF
	jsl.l DrawText
	ply
	rtl
