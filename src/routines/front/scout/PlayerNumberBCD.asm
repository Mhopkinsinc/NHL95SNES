PlayerNumberBCD:					; A = player A's sweater number in BCD (the 7-bit field of its 12-bit
									; entry at SRPlayerTeams)
	sta.b tmp0
	asl a
	adc.b tmp0
	lsr a
	tax
	lda.l SRPlayerTeams,x
	bcc .1
	lsr a
	bra .2
.1:									; A * 2, A * 2, A * 2
	asl a
	asl a
	asl a
.2:									; A and $007F, tmp0 = A, X = A, A = BCDTable,x, ...
	xba
	and.w #$007F
	sta.b tmp0
	tax
	lda.l BCDTable,x
	and.w #$00FF
	rts
