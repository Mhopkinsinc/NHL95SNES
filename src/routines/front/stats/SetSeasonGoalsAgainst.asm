SetSeasonGoalsAgainst:				; stores X as goalie A's season goals against (SRAssists and SRGoals)
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
	tay
	txa
	sta.b $14
	and.w #$0600
	lsr a
	lsr a
	sta.b $16
	lda.w #$FE7F
	sta.b r0+2
	lda.w #$FE00
	sta.b r0
	trb.b $14
	lda.w #$FFF8
	trb.b tmp0
	tyx
	ldy.b tmp0
	dey
	bmi .1
.loop:								; loop: $16 * 2, $14 * 2, Y - 1, if the result >= 0 go to .loop
	asl.b $16
	asl.b $14
	sec
	rol.b r0
	sec
	rol.b r0+2
	dey
	bpl .loop
.1:									; A = SRGoals,x, A and r0+2, A or $16, SRGoals,x = A, ...
	lda.l SRGoals,x
	and.b r0+2
	ora.b $16
	sta.l SRGoals,x
	lda.l SRAssists,x
	and.b r0
	ora.b $14
	sta.l SRAssists,x
	rts
