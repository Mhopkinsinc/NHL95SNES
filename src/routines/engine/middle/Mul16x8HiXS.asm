Mul16x8HiXS:						; X * A (low byte) / 256 into r2+1, X signed
	phy
	tay
	beq Mul16x8Hi_Zero
Mul16x8HiXS_TestX:					; entry used by the routines after it
	txa
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiU_Go
	eor.w #$FFFF
	inc a
Mul16x8HiXS_Neg:					; entry used by the routines after it
	jsl.l Mul16x8HiU_Pre
	eor.w #$FFFF
	inc a
	sta.b r2+1
	ply
	rtl
