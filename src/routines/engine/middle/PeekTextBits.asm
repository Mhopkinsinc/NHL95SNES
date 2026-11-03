PeekTextBits:						; peek the packed text bits at the current source position
	rep #$20
	ldx.b $16
	lda.l $C30000,x
	ldx.b $0A
	beq .rts
.loop:								; loop: A / 2, X - 1, if the result is not 0 go to .loop
	lsr a
	dex
	bne .loop
.rts:								; return
	rts
