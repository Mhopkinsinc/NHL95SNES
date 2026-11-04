PrintTitleBar:						; prints a bar at row Y as wide as A says: its left end, middle pieces,
									; its right end (BoldFontGlyphs characters $5B, $5C, $5D)
	phy
	dec a
	dec a
	dec a
	ldx.w #$0003
	jsl.l DivAByX
	txy
	beq .1
	inc a
.1:									; Y = A, A + 1, A + 1, A + 1, ...
	tay
	inc a
	inc a
	inc a
	jsl.l AllocWorkBuf
	pha
	tax
	sep #$20
	lda.b #$5B
	jsr.w AppendTitleBarByte
	inc a
.loop:								; loop: call AppendTitleBarByte, Y - 1, if the result is not 0 go to
									; .loop, ...
	jsr.w AppendTitleBarByte
	dey
	bne .loop
	inc a
	jsr.w AppendTitleBarByte
	lda.b #$00
	jsr.w AppendTitleBarByte
	rep #$20
	stz.b $0E
	lda.w #BoldFontGlyphs&$FFFF
	sta.b $0C
	lda.b $12
	plx
	jsl.l DrawText
	ply
	jsl.l QueueTextTiles
	jmp.w MapTextTiles
