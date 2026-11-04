PrintItalicLeftStr:					; PrintItalicLeft for the string X in RAM
	jsl.l RenderItalicLeftStr
	bra UploadAndMapTextJump
