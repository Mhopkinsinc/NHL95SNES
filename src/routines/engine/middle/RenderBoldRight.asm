RenderBoldRight:					; render right-aligned packed text in the bold font
	jsl.l UnpackText
	bra DrawBoldRightBuffer
