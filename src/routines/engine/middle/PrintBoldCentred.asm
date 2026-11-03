PrintBoldCentred:					; prints the packed text X at row Y in BoldFontGlyphs, centred between the
									; margins
	jsl.l RenderBoldCentred
	bra UploadAndMapText
