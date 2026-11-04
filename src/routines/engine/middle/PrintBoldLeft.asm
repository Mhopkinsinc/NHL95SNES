PrintBoldLeft:						; prints the packed text X at row Y in BoldFontGlyphs from the left margin
	jsl.l RenderBoldLeft
	bra UploadAndMapText
