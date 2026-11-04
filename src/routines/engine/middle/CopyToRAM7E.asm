CopyToRAM7E:						; copies Y bytes from bank X, address A, to the bank $7E address pushed
									; before the call (BlockMove)
	pha
	txa
	xba
	ora.w #$007E
	sta.w BlockMove+2
	tyx
	lda.b $06,s
	tay
	txa
	dec a
	plx
	jsl.l BlockMove
	lda.b $02,s
	sta.b $04,s
	lda.b $01,s
	sta.b $03,s
	pla
	rtl
