NextSaveBits5:						; A = the 5 bits at bit Y of the save RAM bit array at SRCreatedPlayers; Y
									; + 5
	tya
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	pha
	iny
	iny
	iny
	iny
	iny
	lda.l SRCreatedPlayers,x
	plx
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, A and $001F, ...
	lsr a
	dex
	bpl .loop
	rol a
	and.w #$001F
	rts
