PlaceInfoCursor:					; the cursor sprite (a0) to line d6 of the position, weight, number and
									; hand page: x $73, y d6 * 24 + $50
	ldx.b a0
	lda.w #$0073
	sta.b $05,x
	lda.b d6
	asl a
	asl a
	asl a
	sta.b tmp0
	asl a
	adc.b tmp0
	adc.w #$0050
	sta.b $08,x
	rts
