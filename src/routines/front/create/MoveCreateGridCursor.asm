MoveCreateGridCursor:				; palette 0 on Create Player letter grid cell d6 and the cursor sprite
									; (a0) onto it (x and y from LetterGridX / LetterGridY)
	jsr.w LetterCellPalette0
	ldy.b a0
	lda.b d6
	asl a
	tax
	lda.l LetterGridY,x
	sta.w $0008,y
	lda.l LetterGridX,x
	sta.w $0005,y
	rts
