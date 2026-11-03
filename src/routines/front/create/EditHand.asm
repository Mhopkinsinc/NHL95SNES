EditHand:							; hand line, left or right: $85 toggled between 0 (Right) and 1 (Left),
									; then FieldHand
	lda.b d1+2
	bne .1
	lda.w #$0001
	sta.b d1+2
	jmp.w FieldHand
.1:									; d1+2 = 0, go to FieldHand
	stz.b d1+2
	jmp.w FieldHand
