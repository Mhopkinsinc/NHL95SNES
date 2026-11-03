CopyString2:						; CopyString into the second work buffer (AllocWorkBuf2)
	phy
	phx
	ldy.w #$0001
	sep #$20
.loop:								; loop: if $7E0000,x = 0 go to .1, X + 1, Y + 1, go to .loop
	lda.l $7E0000,x
	beq .1
	inx
	iny
	bra .loop
.1:									; A 16-bit, A = Y, push A, call AllocWorkBuf2, ...
	rep #$20
	tya
	pha
	jsl.l AllocWorkBuf2
	ply
	plx
	pha
	pha
	txa
	ldx.w #$007E
	jsl.l CopyToRAM7E
	plx
	ply
	rtl
