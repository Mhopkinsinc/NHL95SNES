RenderBoldLeftROMStr:				; render a left-aligned ROM string in the bold font
	jsl.l CopyROMString
DrawBoldLeftBuffer:					; draw the prepared text buffer from the left margin in the bold font
	stz.b $0E
	lda.w #BoldFontGlyphs&$FFFF
	sta.b $0C
	phy
	lda.b $CF
	jsl.l DrawText
	ply
	rtl
