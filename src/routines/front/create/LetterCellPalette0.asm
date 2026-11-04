LetterCellPalette0:					; palette 0 on the 2 x 2 tiles of Create Player letter grid cell d6
									; (LetterGridCells), then SendTextMap
	lda.b d6
	asl a
	tax
	lda.b $D3
	adc.l LetterGridCells,x
	tay
	jsr.w SetTilePalette0
	iny
	iny
	jsr.w SetTilePalette0
	tya
	adc.w #$003E
	tay
	jsr.w SetTilePalette0
	iny
	iny
	jsr.w SetTilePalette0
	jsl.l SendTextMap
	rts
