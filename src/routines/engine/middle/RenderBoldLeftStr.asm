RenderBoldLeftStr:					; render a left-aligned RAM string in the bold font
	jsl.l CopyString
	bra DrawBoldLeftBuffer
