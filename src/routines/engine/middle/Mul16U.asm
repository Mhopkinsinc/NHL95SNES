Mul16U:								; A * X into r2 (4 bytes), unsigned
	phy
	tay
	beq Mul16_Zero
	sta.b r0
	txa
	beq Mul16_Zero
Mul16U_Go:							; entry used by the routines after it
	sep #$20
	sta.l WRMPYA
	tya
	sta.l WRMPYB
	stz.b r2
	ldy.b r0+1
	lda.l RDMPYL
	sta.b r1
	lda.l RDMPYH
	sta.b r1+1
	tya
	sta.l WRMPYB
	stz.b r2+3
	nop
	lda.l RDMPYL
	sta.b r2+1
	lda.l RDMPYH
	sta.b r2+2
	xba
	sta.l WRMPYA
	tya
	sta.l WRMPYB
	ldy.b r0
	nop
	lda.l RDMPYL
	sta.b r1+2
	lda.l RDMPYH
	sta.b r1+3
	tya
	sta.l WRMPYB
	rep #$20
	lda.b r2+1
	clc
	adc.l RDMPYL
	sta.b r2+1
	bcc .1
	inc.b r2+3
	clc
.1:									; add the partial products
	lda.b r1
	adc.b r2
	sta.b r2
	lda.b r1+2
	adc.b r2+2
	sta.b r2+2
	ply
	rtl
