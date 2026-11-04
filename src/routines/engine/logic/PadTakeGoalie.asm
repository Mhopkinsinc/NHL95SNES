PadTakeGoalie:						; the pad in d4 takes the goalie: A = 0, PadTakePosition
	lda.w #$0000
	bra PadTakePosition
