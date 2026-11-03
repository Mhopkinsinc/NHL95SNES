Mul16x8HiS:							; X * A / 256 into r2+1, both signed
	phy
	tay
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiXS_TestX
	eor.w #$FFFF
	inc a
	tay
	txa
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiXS_Neg
	eor.w #$FFFF
	inc a
	jmp.w Mul16x8HiU_Go
