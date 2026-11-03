SetSeasonGoals:						; stores X as player A's season goals (9 bits at SRGoals)
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	txy
	lsr a
	lsr a
	lsr a
	tax
	lda.b tmp0
	and.w #$0007
	sty.b tmp0
	tay
	lda.w #$FE00
	dey
	bmi .1
.loop:								; loop: tmp0 * 2, Y - 1, if the result >= 0 go to .loop
	asl.b tmp0
	sec
	rol a
	dey
	bpl .loop
.1:									; $16 = A, A = SRGoals,x, A and $16, A or tmp0, ...
	sta.b $16
	lda.l SRGoals,x
	and.b $16
	ora.b tmp0
	sta.l SRGoals,x
	rts
