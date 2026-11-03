TagPositionMark:					; a tag continuation: the position mark (PositionMarkTiles), none for
									; position 0
	clc
	lda.b $0A
	adc.w #$0008
	sta.b $0A
	ldx.b $0E
	beq TagPadMarker
	lda.l PositionMarkTiles,x
	sta.b tmp1
	lda.w #TagPadMarker
	sta.b tmp3
	jmp.w PutTagChar
