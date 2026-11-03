PrintItalicLeft:					; prints the packed text X at row Y in ItalicFontGlyphs from the left
									; margin
	jsl.l RenderItalicLeft
	bra UploadAndMapText
