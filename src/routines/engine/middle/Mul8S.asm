Mul8S:								; A * X, 8 by 8 bits, both signed, into A
	phy
	tay
	bpl .xsigned
	txa
	bpl .neg
	eor.w #$FFFF
	inc a
	sta.l WRMPYA
	tya
	eor.w #$FFFF
	inc a
	sta.l WRMPYB
	nop
	nop
	lda.l RDMPYL
	ply
	rtl
.xsigned:							; A positive: X decides
	cpx.w #$0000
	bpl .pos
.neg:								; one operand negative: negate the product
	sep #$21
	sta.l WRMPYA
	tya
	eor.b #$FF
	inc a
	sta.l WRMPYB
	rep #$20
	lda.w #$0000
	sbc.l RDMPYL
	ply
	rtl
.pos:								; both positive
	sep #$20
	sta.l WRMPYA
	txa
	sta.l WRMPYB
	rep #$20
	nop
	lda.l RDMPYL
	ply
	rtl
