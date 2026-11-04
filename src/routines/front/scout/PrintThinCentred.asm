PrintThinCentred:					; prints the packed text X at row Y in ThinFontGlyphs, centred between the
									; margins
	jsl.l RenderThinCentred
	bra UploadAndMapTextJump
