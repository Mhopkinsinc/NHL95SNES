RenderItalicCentred:				; unpack and render centred text in the italic font
	jsl.l UnpackText
RenderItalicCentredStr:				; render a centred RAM string in the italic font
	jsl.l CopyString
	bra DrawItalicCentredBuffer
