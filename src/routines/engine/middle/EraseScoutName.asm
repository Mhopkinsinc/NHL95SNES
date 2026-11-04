EraseScoutName:						; an 11 x 2 area of blankchar through eraser (d0, d1, d2); no caller found
	lda.w #$000B
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.w blankchar
	sta.b d2
	jml.l eraser
