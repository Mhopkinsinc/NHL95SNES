SetTilePalette:						; puts palette bits tmp0 on the text map tile at Y (its palette bits
									; cleared first)
	lda.w $0000,y
	and.w #$E3FF
	ora.b tmp0
	sta.w $0000,y
	rts
