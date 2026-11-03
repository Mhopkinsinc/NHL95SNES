SeasonGoalsAgainst:					; A = goalie A's season goals against in BCD, X binary (9 bits at
									; SRAssists and two more at SRGoals)
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
	sta.b tmp1
	lda.l SRAssists,x
.loop:								; loop: tmp1 / 2, A / 2, tmp0 - 1, if the result >= 0 go to .loop, ...
	lsr.b tmp1
	lsr a
	dec.b tmp0
	bpl .loop
	rol a
	and.w #$01FF
	sta.b tmp0
	lda.b tmp1
	and.w #$00C0
	asl a
	asl a
	asl a
	ora.b tmp0
	sta.b tmp0
	jmp.w BinToBCD
