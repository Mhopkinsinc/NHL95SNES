NextSaveBits3:						; A = the 3 bits at bit Y of the save RAM bit array at SRCreatedPlayers; Y
									; + 3
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
	lda.l SRCreatedPlayers,x
	plx
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, A and $0007, ...
	lsr a
	dex
	bpl .loop
	rol a
	and.w #$0007
	rts
