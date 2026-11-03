PrintScoringHead:					; prints column title X bold from $CF on row 15
	ldy.w #$000F
	jsl.l PrintBoldLeft
	rts
