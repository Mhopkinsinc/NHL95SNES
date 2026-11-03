CopyLenString2:						; copies the zero ended string at X into a new second work buffer
									; (AllocWorkBuf2) behind a length
	phy
	phx
	sep #$20
	ldy.w #$0000
	dex
.loop:								; loop: Y + 1, X + 1, if $0000,x is not 0 go to .loop, A 16-bit, ...
	iny
	inx
	lda.w $0000,x
	bne .loop
	rep #$20
	tya
	jsl.l AllocWorkBuf2
	tax
	tya
	sta.w $0000,x
	ply
	pha
	sep #$20
.loop2:								; loop: $0001,x = $0000,y, if $0000,y = 0 go to .1, Y + 1, X + 1, ...
	lda.w $0000,y
	sta.w $0001,x
	beq .1
	iny
	inx
	bra .loop2
.1:									; A 16-bit, pull X, pull Y, return
	rep #$20
	plx
	ply
	rtl
