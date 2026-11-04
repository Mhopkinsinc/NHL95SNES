PrintItalicCentredROMStr:			; print a centred ROM string in the italic font
	jsl.l RenderItalicCentredROMStr
	bra UploadAndMapTextJump
