RenderBoldCentredStr:				; render a centred RAM string in the bold font
	jsl.l CopyString
	bra DrawBoldCentredBuffer
