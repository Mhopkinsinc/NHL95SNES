SetSeasonSaves:						; stores X as goalie A's season saves (12 bits at SRGoalieSaves by its
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
	txy
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
	bcc .1
	tya
	asl a
	asl a
	asl a
	asl a
	sta.b tmp0
	lda.l SRGoalieSaves,x
	and.w #$000F
	ora.b tmp0
	sta.l SRGoalieSaves,x
	rts
.1:									; tmp0 = Y, A = SRGoalieSaves,x, A and $F000, A or tmp0, ...
	sty.b tmp0
	lda.l SRGoalieSaves,x
	and.w #$F000
	ora.b tmp0
	sta.l SRGoalieSaves,x
	rts
