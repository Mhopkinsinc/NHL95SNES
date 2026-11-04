MoveGridCursor:						; puts the cursor's palette 0 on letter grid cell a1 (GridCellPalette0)
									; and moves the cursor sprite (a0) onto it (x and y from LetterGridX /
									; LetterGridY)
	jsr.w GridCellPalette0
	ldy.b a0
	lda.b a1
	asl a
	tax
	lda.l LetterGridX,x
	sta.w $0005,y
	lda.l LetterGridY,x
	clc
	adc.w #$0018
	sta.w $0008,y
	rts
