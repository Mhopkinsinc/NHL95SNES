RatingNibble:						; A = the 0-6 rating of value A (0-15), from the table after it
	tax
	lda.l RatingLevels,x
	and.w #$00FF
	rts
