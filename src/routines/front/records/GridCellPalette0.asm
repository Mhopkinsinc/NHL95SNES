GridCellPalette0:					; puts palette 0 (the cursor's) on letter grid cell a1 (SetGridCellPalette
									; 0)
	lda.w #$0000
	bra SetGridCellPalette
