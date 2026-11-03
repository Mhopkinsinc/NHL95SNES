PickUnusedLineDefenceman:			; selects the next ranked defenceman not in the used list; carry set when
									; the pool is exhausted
	rep #$20
	lda.b tmp2
	cmp.b $0A
	beq NoLineDefenceman
	asl a
	tay
	sep #$20
	lda.w ScratchBuf+$100,y
	jsr.w IsLineDefencemanUsed
	bcs PickUnusedLineDefenceman
	ldx.b $14
	rts
