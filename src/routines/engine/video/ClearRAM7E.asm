ClearRAM7E:							; clears Y bytes at A in bank $7E: a zero, then a block move through the
									; RAM routine
	phy
	tax
	inc a
	tay
	sep #$20
	lda.b #$00
	sta.l $7E0000,x
	rep #$20
	lda.w #$7E7E
	sta.w BlockMove+2
	pla
	dec a
	jml.l BlockMove
