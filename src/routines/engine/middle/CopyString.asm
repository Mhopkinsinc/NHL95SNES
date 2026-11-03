CopyString:							; copies the zero ended string at X (bank $7E) into a new work buffer;
									; returns X = the copy
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
.1:									; A 16-bit, A = Y, push A, call AllocWorkBuf, ...
	rep #$20
	tya
	pha
	jsl.l AllocWorkBuf
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
