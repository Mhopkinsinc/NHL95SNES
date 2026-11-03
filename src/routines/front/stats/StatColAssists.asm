StatColAssists:						; PlayerStatColumn's assists column (tmassists)
	plx
	lda.w tmassists,x
	and.w #$00FF
	rts
