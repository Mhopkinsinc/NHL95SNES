WriteTiles4:						; with D = $2100: a new map row (SetVRAMRow) of 4 tiles X, X + 1, ... (X
									; advanced)
	jsr.w SetVRAMRow
	lda.w #$0003
	bra WriteTilesLoop
