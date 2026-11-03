SeasonGoalieGames:					; A = goalie A's season games in BCD, X binary: its goalie index (7 bits
									; at SRGoals), then 7 bits a goalie at SRGoalieGames
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	lsr a
	lsr a
	lsr a
	tax
	lda.w #$FFF8
	trb.b tmp0
	lda.l SRGoals,x
.loop:								; loop: A / 2, tmp0 - 1, if the result >= 0 go to .loop, A and $007F, ...
	lsr a
	dec.b tmp0
	bpl .loop
	rol a
	and.w #$007F
	sta.b tmp0
	asl a
	adc.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	lsr a
	lsr a
	lsr a
	tax
	lda.w #$FFF8
	trb.b tmp0
	lda.l SRGoalieGames,x
	ldx.b tmp0
.loop2:								; loop: A / 2, X - 1, if the result >= 0 go to .loop2, A and $007F, ...
	lsr a
	dex
	bpl .loop2
	rol a
	and.w #$007F
	sta.b tmp0
	jmp.w BinToBCD
