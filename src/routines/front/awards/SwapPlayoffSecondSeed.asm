SwapPlayoffSecondSeed:				; swaps the selected ranked entry with the second playoff seed
	lda.w ScratchBuf+$C
	ldx.w ScratchBuf,y
	sta.w ScratchBuf,y
	stx.w ScratchBuf+$C
	rts
