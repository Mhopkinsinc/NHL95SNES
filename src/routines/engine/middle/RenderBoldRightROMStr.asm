RenderBoldRightROMStr:				; render a right-aligned ROM string in the bold font
	jsl.l CopyROMString
DrawBoldRightBuffer:				; draw the prepared text buffer ending at the right margin in the bold
									; font
	stz.b $0E
	lda.w #BoldFontGlyphs&$FFFF
	sta.b $0C
	phy
	jsl.l TextWidth
	sec
	lda.b $D1
	sbc.b $0A
	jsl.l DrawText
	ply
	rtl
