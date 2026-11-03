PrintItalicCentredStr:				; PrintItalicCentred for the string X in RAM
	jsl.l RenderItalicCentredStr
	bra UploadAndMapTextJump
