SetSeasonGoalieGames:				; stores X as goalie A's season games (7 bits at SRGoalieGames by its
									; goalie index)
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
	stx.b $16
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
	ldy.b tmp0
	lda.w #$FF80
	dey
	bmi .1
.loop2:								; loop: $16 * 2, Y - 1, if the result >= 0 go to .loop2
	asl.b $16
	sec
	rol a
	dey
	bpl .loop2
.1:									; tmp0 = A, A = SRGoalieGames,x, A and tmp0, A or $16, ...
	sta.b tmp0
	lda.l SRGoalieGames,x
	and.b tmp0
	ora.b $16
	sta.l SRGoalieGames,x
	rts
