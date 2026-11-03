PrintItalicRight:					; prints the packed text X at row Y in ItalicFontGlyphs, ending at the
									; right margin
	jsl.l RenderItalicRight
	bra UploadAndMapTextJump
