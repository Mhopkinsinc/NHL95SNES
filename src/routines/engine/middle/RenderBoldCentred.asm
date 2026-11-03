RenderBoldCentred:					; render centred packed text in the bold font
	jsl.l UnpackText
	bra DrawBoldCentredBuffer
