WriteUserField5:					; writes A as the 5-bit field of the user record at X (byte a4, bit $75)
	stx.b $77
	ldx.w #$001F
	stx.b $7B
	ldy.b a4
	ldx.b $75
.loop:								; loop: $7B * 2, A * 2, X - 1, if the result >= 0 go to .loop, ...
	asl.b $7B
	asl a
	dex
	bpl .loop
	lsr a
	sta.b $7D
	lda.b $7B
	lsr a
	eor.w #$FFFF
	sta.b $7B
	lda.b [$77],y
	and.b $7B
	ora.b $7D
	sta.b [$77],y
	rts
