SeasonSaves:						; A = goalie A's season saves in BCD, X binary: its goalie index (7 bits
									; at SRGoals), then 12 bits a goalie at SRGoalieSaves
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
	lsr a
	tax
	lda.l SRGoalieSaves,x
	bcc .1
	lsr a
	lsr a
	lsr a
	lsr a
.1:									; A and $0FFF, tmp0 = A, go to BinToBCD
	and.w #$0FFF
	sta.b tmp0
	jmp.w BinToBCD
