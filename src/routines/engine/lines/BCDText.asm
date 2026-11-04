BCDText:							; the BCD number A as text (no leading zeros, zero ended) at the start of
									; the number buffer
	ldx.w #$0000
BCDTextAt:							; the BCD number A as text (no leading zeros, zero ended) at X in the
									; number buffer; X moves past it
	phy
	ldy.w #$0000
	pha
	xba
	and.w #$00F0
	beq .1
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0030
	sta.w mesarea,x
	inx
	iny
.1:									; A = $01,s, if the result is not 0 go to .2, if Y = $0000 go to .3
	lda.b $01,s
	xba
	and.w #$000F
	bne .2
	cpy.w #$0000
	beq .3
.2:									; A + $0030, mesarea,x = A, X + 1, Y + 1
	clc
	adc.w #$0030
	sta.w mesarea,x
	inx
	iny
.3:									; A = $01,s, if the result is not 0 go to .4, if Y = $0000 go to .5
	lda.b $01,s
	and.w #$00F0
	bne .4
	cpy.w #$0000
	beq .5
.4:									; A / 2, A / 2, A / 2, A / 2, ...
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0030
	sta.w mesarea,x
	inx
	iny
.5:									; A = $01,s, A and $000F, A + $0030, mesarea,x = A, ...
	lda.b $01,s
	and.w #$000F
	clc
	adc.w #$0030
	sta.w mesarea,x
	inx
	pla
	ply
	rts
