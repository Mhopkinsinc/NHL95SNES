PickUnusedLineForward:				; selects the next ranked forward not in the used list; carry set when the
									; pool is exhausted
	rep #$20
	lda.b tmp2
	cmp.b tmp3
	beq NoLineForward
	asl a
	tay
	sep #$20
	lda.w ScratchBuf+$80,y
	jsr.w IsLineForwardUsed
	bcs PickUnusedLineForward
	ldx.b $14
	rts
