RenderItalicRight:					; render right-aligned packed text in the italic font
	jsl.l UnpackText
DrawItalicRightBuffer:				; draw the prepared text buffer ending at the right margin in the italic
									; font
	lda.w #$0003
	sta.b $0E
	lda.w #ItalicFontGlyphs&$FFFF
	sta.b $0C
	phy
	jsl.l TextWidth
	sec
	lda.b $D1
	sbc.b $0A
	jsl.l DrawText
	ply
	rtl
