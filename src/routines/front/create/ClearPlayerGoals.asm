ClearPlayerGoals:					; clears player A's 9-bit field of SRGoals
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
	lda.b tmp0
	and.w #$0007
	tay
	lda.w #$FE00
.loop:								; loop: Y - 1, if the result < 0 go to .1, go to .loop
	dey
	bmi .1
	sec
	rol a
	bra .loop
.1:									; tmp0 = A, A = SRGoals,x, A and tmp0, SRGoals,x = A, ...
	sta.b tmp0
	lda.l SRGoals,x
	and.b tmp0
	sta.l SRGoals,x
	rts
