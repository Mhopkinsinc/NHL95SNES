WaitFrame:							; wait for the next frame (FrameCount changes)
	pha
	lda.w FrameCount
.loop:								; until FrameCount changes
	cmp.w FrameCount
	beq .loop
	pla
	rtl
