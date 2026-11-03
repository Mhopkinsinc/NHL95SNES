ReadUserField5:						; A = the 5-bit field of the user record at X (byte a1, bit $69)
	stx.b a2
	ldy.b a1
	ldx.b a1+2
	lda.b [a2],y
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, A and $001F, ...
	lsr a
	dex
	bpl .loop
	rol a
	and.w #$001F
	rts
