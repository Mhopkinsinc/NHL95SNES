SkaterRatingRowUp:					; applies palette 3 to the old rating row and decrements d6, stopping at
									; zero
	lda.w #$0007
	jsr.w RatingRowPalette3
	dec.b d6
	bpl SkaterRatingRowUpReturn
	stz.b d6
SkaterRatingRowUpReturn:			; returns after the rating row change or at its boundary
	rts
