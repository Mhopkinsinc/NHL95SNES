RecordOverall:						; A = the overall rating (25-100) of the player record in mesarea: its
									; attribute nibbles weighted (RosterAttribWeights, the set by RatingMode),
									; at most 100, below 50 made 25 + A / 2
	ldx.w #$5DF9
	lda.l $7E24DC
	beq .1
	ldx.w #$F0C9
.1:									; tmp0 = X, tmp3 = 0, A = $000F
	stx.b tmp0
	stz.b tmp3
	lda.w #$000F
.loop:								; loop: $0A = A, A * 2, X = A, A = BitMaskTable2,x, ...
	sta.b $0A
	asl a
	tax
	lda.l BitMaskTable2,x
	bit.b tmp0
	beq .3
	lda.b $0A
	lsr a
	tax
	lda.w mesarea,x
	bcs .2
	lsr a
	lsr a
	lsr a
	lsr a
.2:									; A and $000F, Y = A, A = $0A, A + $7E24DC, ...
	and.w #$000F
	tay
	lda.b $0A
	clc
	adc.l $7E24DC
	tax
	lda.l RosterAttribWeights,x
	tyx
	jsl.l Mul8U
	clc
	adc.b tmp3
	sta.b tmp3
.3:									; A = $0A, A - 1, if the result is not 0 go to .loop, ...
	lda.b $0A
	dec a
	bne .loop
	lda.b tmp3
	bpl .4
	lda.w #$0000
.4:									; if RatingMode = 0 go to .5, A / 2
	ldx.w RatingMode
	beq .5
	lsr a
.5:									; if A < $0065 go to .6, A = $0064
	cmp.w #$0065
	bcc .6
	lda.w #$0064
.6:									; if A >= $0032 go to .rts, A / 2, A + $0019
	cmp.w #$0032
	bcs .rts
	lsr a
	clc
	adc.w #$0019
.rts:								; return
	rts
