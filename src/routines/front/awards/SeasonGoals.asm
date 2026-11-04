SeasonGoals:						; A = player A's season goals in BCD, X binary (9 bits a player in the
									; save RAM array at SRGoals)
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
.loop:								; loop: A / 2, tmp0 - 1, if the result >= 0 go to .loop, A and $01FF, ...
	lsr a
	dec.b tmp0
	bpl .loop
	rol a
	and.w #$01FF
	sta.b tmp0
	jmp.w BinToBCD
