WriteTiles9:						; with D = $2100: a new map row (SetVRAMRow) of 9 tiles X, X + 1, ... (X
									; advanced)
	jsr.w SetVRAMRow
	lda.w #$0008
WriteTilesLoop:						; writes A plus one consecutive tiles starting at X with D at the PPU
									; registers
	stx.b $18
	inx
	dec a
	bpl WriteTilesLoop
	rts
