Mul16x8XS24:						; X (16 bits, signed) * A (low byte, unsigned) into $14 (3 bytes) by the
									; hardware multiplier, a byte of X at a time; no caller found
	sep #$20
	sta.l WRMPYA
	rep #$20
	txa
	bmi .1
	sta.l WRMPYB
	xba
	tax
	nop
	lda.l RDMPYL
	sta.b $14
	txa
	sta.l WRMPYB
	clc
	lda.b $15
	and.w #$00FF
	adc.l RDMPYL
	sta.b $15
	rts
.1:									; A xor $FFFF, A + 1, WRMPYB = A, X = A, ...
	eor.w #$FFFF
	inc a
	sta.l WRMPYB
	xba
	tax
	nop
	lda.l RDMPYL
	sta.b $14
	txa
	sta.l WRMPYB
	clc
	lda.b $15
	and.w #$00FF
	adc.l RDMPYL
	eor.w #$FF00
	sta.b $15
	lda.b $14
	eor.w #$FFFF
	inc a
	bne .2
	inc.b $16
.2:									; $14 = A, return
	sta.b $14
	rts
