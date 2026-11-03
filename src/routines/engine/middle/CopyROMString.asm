CopyROMString:						; copy the zero-terminated ROM string at X into a new work buffer
	phy
	phx
	ldy.w #$0001
	sep #$20
.loop:								; loop: if $C30000,x = 0 go to .1, X + 1, Y + 1, go to .loop
	lda.l $C30000,x
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
	ldx.w #$00C3
	jsl.l CopyToRAM7E
	plx
	ply
	rtl
