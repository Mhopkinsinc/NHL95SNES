Div32x16U:							; X:A (32 bits) / Y (16 bits) into X:A, the remainder in Y, unsigned
									; (shift and subtract); no caller found
	stx.b r0+2
	sta.b r0
	stz.b r1
	sty.b r1+2
	stz.b r2
	stz.b r2+2
	ldy.w #$0010
	lda.b r1+2
.loop:								; loop: A * 2, Y + 1, if carry clear go to .loop, r1+2 = A
	asl a
	iny
	bcc .loop
	ror a
	sta.b r1+2
.loop2:								; loop: r2 * 2, if r0+2 < r1+2 go to .3, if not zero go to .1, ...
	asl.b r2
	rol.b r2+2
	lda.b r0+2
	cmp.b r1+2
	bcc .3
	bne .1
	lda.b r0
	cmp.b r1
	bcs .2
	lsr.b r1+2
	ror.b r1
	dey
	bne .loop2
	lda.b r2
	ldx.b r2+2
	ldy.b r0
	rts
.1:									; A = r0
	lda.b r0
.2:									; A - r1, r0 = A, A = r0+2, A - r1+2, ...
	sbc.b r1
	sta.b r0
	lda.b r0+2
	sbc.b r1+2
	sta.b r0+2
	lda.w #$0001
	tsb.b r2
.3:									; r1+2 / 2, Y - 1, if the result is not 0 go to .loop2, A = r2, ...
	lsr.b r1+2
	ror.b r1
	dey
	bne .loop2
	lda.b r2
	ldx.b r2+2
	ldy.b r0
	rts
