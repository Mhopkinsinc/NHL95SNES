RenderBoldLeft:						; render left-aligned packed text in the bold font
	jsl.l UnpackText
	bra DrawBoldLeftBuffer
