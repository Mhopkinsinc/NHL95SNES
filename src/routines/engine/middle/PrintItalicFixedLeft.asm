PrintItalicFixedLeft:				; print packed italic text from the left margin with glyph width A
	sta.b p0
	jsl.l UnpackText
DrawItalicFixedLeft:				; draw and upload italic text with the supplied fixed glyph width
	lda.w #$4003
	sta.b $0E
	lda.w #ItalicFontGlyphs&$FFFF
	sta.b $0C
	phy
	lda.b $CF
	jsl.l DrawText
	ply
UploadAndMapTextJump:				; continue to queue and map the rendered text
	bra UploadAndMapText
