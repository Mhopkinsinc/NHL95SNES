PeekSkipBits:						; A = the packed text word at X shifted right by Y
	lda.l $C30000,x
	cpy.w #$0000
	beq .rts
	phy
.loop:								; loop: A / 2, Y - 1, if the result is not 0 go to .loop, pull Y
	lsr a
	dey
	bne .loop
	ply
.rts:								; return
	rts
