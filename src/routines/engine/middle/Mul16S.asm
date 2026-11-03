Mul16S:								; A * X into r2 (4 bytes), both signed
	phy
	tay
	beq Mul16_Zero
	bpl Mul16XS_TestX
	eor.w #$FFFF
	inc a
	tay
	sta.b r0
	txa
	beq Mul16_Zero
	bpl Mul16XS_Neg
	eor.w #$FFFF
	inc a
	bra Mul16U_Go
