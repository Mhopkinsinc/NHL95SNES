EraseBoxUnused:						; eraser (a bare rtl) for a 19 x 9 box of blankchar (d0 / d1 / d2);
									; nothing calls it
	lda.w #$0013
	sta.b d0
	lda.w #$0009
	sta.b d1
	lda.w blankchar
	sta.b d2
	jml.l eraser
