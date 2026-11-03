PrintItalicLeftROMStr:				; print a left-aligned ROM string in the italic font
	jsl.l RenderItalicLeftROMStr
	bra UploadAndMapTextJump
