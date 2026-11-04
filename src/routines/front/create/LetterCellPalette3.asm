LetterCellPalette3:					; palette 3 on the 2 x 2 tiles of Create Player letter grid cell d6
									; (LetterGridCells)
	lda.b d6
	asl a
	tax
	lda.b $D3
	adc.l LetterGridCells,x
	tay
	jsr.w SetTilePalette3
	iny
	iny
	jsr.w SetTilePalette3
	tya
	adc.w #$003E
	tay
	jsr.w SetTilePalette3
	iny
	iny
SetTilePalette3:					; palette 3 on the text map tile at Y
	lda.w $0000,y
	and.w #$E3FF
	ora.w #$0C00
	sta.w $0000,y
	rts
