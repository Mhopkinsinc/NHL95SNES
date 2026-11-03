SetTilePalette0:					; palette 0 on the text map tile at Y
	lda.w $0000,y
	and.w #$E3FF
	ora.w #$0000
	sta.w $0000,y
	rts
