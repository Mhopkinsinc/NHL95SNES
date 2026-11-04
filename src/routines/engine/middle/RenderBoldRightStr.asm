RenderBoldRightStr:					; render a right-aligned RAM string in the bold font
	jsl.l CopyString
	bra DrawBoldRightBuffer
