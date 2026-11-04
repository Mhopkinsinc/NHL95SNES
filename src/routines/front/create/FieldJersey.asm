FieldJersey:						; prints the created player's number (d1, two digits) on row $E, its field
									; cleared first
	lda.w #$000E
	jsr.w ClearFieldValue
	lda.b d1
	jsr.w BinToBCD
	jsr.w BCDDigits4
	ldx.w #mesarea+2
	ldy.w #$000E
	jsl.l PrintItalicLeftStr
	rts
