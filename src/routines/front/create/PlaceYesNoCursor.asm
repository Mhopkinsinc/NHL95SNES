PlaceYesNoCursor:					; the cursor sprite (a0) to x $6A on the Yes (d6 = 0, y $87) or No (y $9F)
									; line
	lda.w #$006A
	ldx.b a0
	sta.b $05,x
	lda.b d6
	beq .1
	lda.w #$009F
	sta.b $08,x
	rts
.1:									; $08,x = $0087, return
	lda.w #$0087
	sta.b $08,x
	rts
