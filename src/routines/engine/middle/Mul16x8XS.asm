Mul16x8XS:							; X (16 bits) * A (8 bits) into r2, X signed
	phy
	tay
	beq Mul16x8_Zero
Mul16x8XS_neg:						; entry used by the routines after it
	txa
	beq Mul16x8_Zero
	bpl Mul16x8U_go
	eor.w #$FFFF
	inc a
Mul16x8XS_mul:						; entry used by the routines after it
	jsl.l Mul16x8U_Pre
Mul16x8XS_negres:					; entry used by the routines after it
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
	ply
	rtl
