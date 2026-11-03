ClearFrameHook:						; set the frame hook back to the empty routine
	pha
	phx
	ldx.w #NullHook>>16
	lda.w #NullHook
	jsl.l SetFrameHook
	plx
	pla
	rtl
