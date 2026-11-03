PrintBoldRightStr:					; PrintBoldRight for the string X in RAM
	jsl.l RenderBoldRightStr
	bra UploadAndMapText
