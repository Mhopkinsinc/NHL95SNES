GetTopPlayoffSeedMask:				; returns the conference and division mask of the top ranked team
	ldy.w ScratchBuf+$E
	ldx.w $000C,y
	lda.l TeamDivisionCodes,x
	rts
