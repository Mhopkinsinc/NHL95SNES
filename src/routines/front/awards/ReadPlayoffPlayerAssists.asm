ReadPlayoffPlayerAssists:			; returns the seven-bit playoff assists total for player A on playoff team
									; X
	sta.b tmp0
	asl a
	asl a
	asl a
	sec
	sbc.b tmp0
	sta.b tmp0
	txa
	asl a
	tax
	lda.l PlayoffStatBitOffsets,x
	adc.b tmp0
	tay
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	tay
	lda.l SRPOAssists,x
.loop:								; loop: A / 2, Y - 1, if the result >= 0 go to .loop, A and $007F, ...
	lsr a
	dey
	bpl .loop
	rol a
	and.w #$007F
	rts
