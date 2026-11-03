PrintBoldRightROMStr:				; print a right-aligned ROM string in the bold font
	jsl.l RenderBoldRightROMStr
	bra UploadAndMapTextJump
