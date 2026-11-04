PlayerNumberTeam:					; A = player A's number in BCD (high byte) and team (low byte) from its
									; 12-bit entry at SRPlayerTeams
	sta.b tmp1
	asl a
	adc.b tmp1
	lsr a
	tax
	lda.l SRPlayerTeams,x
	sta.b tmp1
	bcc .1
	xba
	lsr a
	and.w #$007F
	tax
	lda.l BCDTable-1,x
	and.w #$FF00
	pha
	lda.b tmp1
	and.w #$01F0
	lsr a
	lsr a
	lsr a
	lsr a
	ora.b $01,s
	plx
	rts
.1:									; A * 2, A * 2, A * 2, A and $007F, ...
	asl a
	asl a
	asl a
	xba
	and.w #$007F
	tax
	lda.l BCDTable-1,x
	and.w #$FF00
	pha
	lda.b tmp1
	and.w #$001F
	ora.b $01,s
	plx
	rts
