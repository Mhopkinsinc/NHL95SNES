PrintBoldCentredStr:				; PrintBoldCentred for the string X in RAM (CopyString)
	jsl.l RenderBoldCentredStr
UploadAndMapText:					; queue rendered text tiles and map them onto the screen
	jsl.l QueueTextTiles
	jmp.w MapTextTiles
