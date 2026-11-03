RenderBoldCentredROMStr:			; render a centred ROM string in the bold font
	jsl.l CopyROMString
DrawBoldCentredBuffer:				; draw the prepared text buffer centred in the bold font
	stz.b $0E
	lda.w #BoldFontGlyphs&$FFFF
	sta.b $0C
	phy
	jsl.l CentreText
	jsl.l DrawText
	ply
	rtl
