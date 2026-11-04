EnteredNameLength:					; Y = the length of the name entered in mesarea: the cursor a3, + 1 when
									; the character there is not the blank mark ($3E)
	sep #$30
	ldy.b a3
	lda.b #$3E
	cmp.w mesarea,y
	beq .1
	iny
.1:									; A, X / Y 16-bit, return
	rep #$30
	rts
