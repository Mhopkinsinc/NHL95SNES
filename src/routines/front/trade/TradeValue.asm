TradeValue:							; one side of a trade: the value of its chosen players (from their
									; ratings, RecordOverall) into (tmp1), and how many goalies (d0), forwards
									; and defencemen (d1) it gives
	stz.b d0
	stz.b d0+2
	stz.b d1
	stz.b r1
	lda.w #$0000
.1:									; d4+2 = A, Y = A, A = (d2),y, if $0001 bits clear go to .5, ...
	sta.b d4+2
	tay
	lda.b (d2),y
	bit.w #$0001
	beq .5
	tya
	ldx.b a4
	stz.w RatingMode
	cmp.w $0002,x
	bcc .3
	sbc.w $0002,x
	cmp.w $0004,x
	bcc .2
	inc.b d1
	bra .4
.2:									; d0+2 + 1, go to .4
	inc.b d0+2
	bra .4
.3:									; d0 + 1, RatingMode = $0010
	inc.b d0
	ldx.w #$0010
	stx.w RatingMode
.4:									; A = Y, A * 2, A * 2, A * 2, ...
	tya
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b a4
	tax
	lda.w $0110,x
	sta.w mesarea
	lda.w $0112,x
	sta.w mesarea+2
	lda.w $0114,x
	sta.w mesarea+4
	lda.w $0116,x
	sta.w mesarea+6
	jsr.w RecordOverall
	clc
	adc.b (tmp1)
	sta.b (tmp1)
	inc.b r1
.5:									; A = d4+2, A + 1, if A is not tmp2 go to .1, if r1 = 0 go to .rts, ...
	lda.b d4+2
	inc a
	cmp.b tmp2
	bne .1
	lda.b r1
	beq .rts
	lda.b (tmp1)
	sta.b r2
	jsl.l Div16U
	lda.b r0
	clc
	adc.b (tmp1)
	lsr a
	sta.b (tmp1)
.rts:								; return
	rts
