NextSaveBits8:						; A = the 8 bits at bit Y of the save RAM bit array at SRCreatedPlayers; Y
									; + 8
	tya
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	pha
	tya
	clc
	adc.w #$0008
	tay
	lda.l SRCreatedPlayers,x
	plx
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, A and $00FF, ...
	lsr a
	dex
	bpl .loop
	rol a
	and.w #$00FF
	rts
