FieldWeight:						; prints the created player's weight, $81 * 8 + 140, on row $B, its field
									; cleared first
	lda.w #$000B
	jsr.w ClearFieldValue
	lda.b d0+2
	asl a
	asl a
	asl a
	adc.w #$008C
	jsr.w BinToBCD
	jsr.w BCDDigits4
	ldx.w #mesarea+1
	ldy.w #$000B
	jsl.l PrintItalicLeftStr
	rts
