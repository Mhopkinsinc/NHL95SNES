WaitPausePadRelease:				; wait for the pause controller to release all buttons
	phx
	pha
	ldx.w pausepad
.loop:								; loop: if PadRaw1,x is not 0 go to .loop, pull A, pull X, return
	lda.b PadRaw1,x
	bne .loop
	pla
	plx
	rtl
