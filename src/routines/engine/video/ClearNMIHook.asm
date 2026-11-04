ClearNMIHook:						; set the NMI hook back to the empty routine
	pha
	phx
	ldx.w #NullHook>>16
	lda.w #NullHook
	jsl.l SetNMIHook
	plx
	pla
	rtl
