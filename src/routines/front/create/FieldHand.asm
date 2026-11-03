FieldHand:							; prints the created player's hand (Left when $85 is set, else Right) on
									; row $11, its field cleared first
	lda.w #$0011
	jsr.w ClearFieldValue
	ldx.w #$49ED
	lda.b d1+2
	beq .1
	ldx.w #TxtLeft&$FFFF
.1:									; Y = $0011, call PrintItalicLeft, return
	ldy.w #$0011
	jsl.l PrintItalicLeft
	rts
