PrintBoldFixedLeft:					; print packed bold text from the left margin with glyph width A
	sta.b p0
	jsl.l UnpackText
DrawBoldFixedLeft:					; draw and upload bold text with the supplied fixed glyph width
	lda.w #$4000
	sta.b $0E
	lda.w #BoldFontGlyphs&$FFFF
	sta.b $0C
	phy
	lda.b $CF
	jsl.l DrawText
	ply
	bra UploadAndMapTextJump
