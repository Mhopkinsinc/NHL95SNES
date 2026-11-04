Mul16x8HiU:							; X * A (low byte) / 256 into r2+1, unsigned
	phy
	tay
	beq Mul16x8Hi_Zero
	txa
	beq Mul16x8Hi_Zero
Mul16x8HiU_Go:						; entry used by the routines after it
	sep #$20
	sta.l WRMPYA
	tya
	sta.l WRMPYB
	stz.b r2+2
	xba
	sta.l WRMPYA
	lda.l RDMPYH
	sta.b r2+1
	tya
	sta.l WRMPYB
	rep #$21
	lda.b r2+1
	adc.l RDMPYL
	sta.b r2+1
	ply
	rtl
