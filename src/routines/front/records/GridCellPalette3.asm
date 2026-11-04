GridCellPalette3:					; puts palette 3 (the cells' normal look) on letter grid cell a1
									; (SetGridCellPalette $0C00)
	lda.w #$0C00
SetGridCellPalette:					; puts palette bits tmp0 on the 2 x 2 tiles of letter grid cell a1 (its
									; position from LetterGridCells), then SendTextMap
	sta.b tmp0
	lda.b a1
	asl a
	tax
	lda.b $D3
	adc.l LetterGridCells,x
	adc.w #$00C0
	tay
	jsr.w SetTilePalette
	iny
	iny
	jsr.w SetTilePalette
	tya
	adc.w #$003E
	tay
	jsr.w SetTilePalette
	iny
	iny
	jsr.w SetTilePalette
	jsl.l SendTextMap
	rts
