PrintItalicCentred:					; prints the packed text X at row Y in ItalicFontGlyphs, centred between
									; the margins
	jsl.l RenderItalicCentred
	bra UploadAndMapTextJump
