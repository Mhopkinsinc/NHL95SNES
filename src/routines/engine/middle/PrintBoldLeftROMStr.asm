PrintBoldLeftROMStr:				; print a left-aligned ROM string in the bold font
	jsl.l RenderBoldLeftROMStr
	bra UploadAndMapText
