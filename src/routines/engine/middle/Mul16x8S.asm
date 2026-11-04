Mul16x8S:							; X (16 bits) * A (8 bits) into r2, both signed
	phy
	tay
	beq Mul16x8_Zero
	bpl Mul16x8XS_neg
	eor.w #$FFFF
	inc a
	tay
	txa
	beq Mul16x8_Zero
	bpl Mul16x8XS_mul
	eor.w #$FFFF
	inc a
	jmp.w Mul16x8U_go
