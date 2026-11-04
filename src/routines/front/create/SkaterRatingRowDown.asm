SkaterRatingRowDown:				; applies palette 3 to the old rating row and increments d6 below eleven
	lda.w #$0007
	jsr.w RatingRowPalette3
	lda.b d6
	inc a
	cmp.w #$000B
	bcs SkaterRatingRowUpReturn
	sta.b d6
GoalieRatingsInputReturn:			; the rts GoalieRatingsInput branches to
	rts
