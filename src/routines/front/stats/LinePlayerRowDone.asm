LinePlayerRowDone:					; DrawLinePlayerRow's column drawn: the text palette back to normal ($D5 =
									; $2000)
	lda.w #$2000
	sta.b $D5
	rts
