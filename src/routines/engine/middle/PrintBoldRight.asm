PrintBoldRight:						; prints the packed text X at row Y in BoldFontGlyphs, ending at the right
									; margin
	jsl.l RenderBoldRight
	bra UploadAndMapText
