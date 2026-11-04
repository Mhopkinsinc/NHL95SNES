StatColShots:						; PlayerStatColumn's shots column (tmpshots)
	plx
	lda.w tmpshots,x
	and.w #$00FF
	rts
