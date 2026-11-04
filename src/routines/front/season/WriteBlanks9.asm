WriteBlanks9:						; with D = $2100: a new map row (SetVRAMRow) of 9 zero tiles
	jsr.w SetVRAMRow
	lda.w #$0008
WriteBlanksLoop:					; writes A plus one zero tiles with D at the PPU registers
	stz.b $18
	dec a
	bpl WriteBlanksLoop
	rts
