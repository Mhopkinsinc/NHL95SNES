StoreIntroPixel:					; stores the assembled intro pixel with its palette base unless
									; transparent
	lda.b a4
	beq .1
	ora.b $79
.1:									; $0000,x = A, X + 1, a4 = 0, return
	sta.w $0000,x
	inx
	stz.b a4
	rts
