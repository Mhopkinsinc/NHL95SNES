WriteBlanks4:						; with D = $2100: a new map row (SetVRAMRow) of 4 zero tiles
	jsr.w SetVRAMRow
	lda.w #$0003
	bra WriteBlanksLoop
