PrintBoldLeftStr:					; PrintBoldLeft for the string X in RAM
	jsl.l RenderBoldLeftStr
	bra UploadAndMapText
