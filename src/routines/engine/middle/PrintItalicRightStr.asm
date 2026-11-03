PrintItalicRightStr:				; PrintItalicRight for the string X in RAM
	jsl.l RenderItalicRightStr
	bra UploadAndMapText
