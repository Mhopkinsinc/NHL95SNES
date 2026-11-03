Mul16XS:							; A * X into r2 (4 bytes), X signed
	phy
	tay
	beq Mul16_Zero
Mul16XS_TestX:						; entry used by the routines after it
	sta.b r0
	txa
	beq Mul16_Zero
	bpl Mul16U_Go
	eor.w #$FFFF
	inc a
Mul16XS_Neg:						; entry used by the routines after it
	jsl.l Mul16U_Pre
	jmp.w Mul16x8XS_negres
