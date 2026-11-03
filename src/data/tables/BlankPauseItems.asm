BlankPauseItems:					; seven blank items (12 spaces each): clear the item rows, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 7
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	db $11,$99,$4B,$00,$AB,$12,$FF,$FF,$9E,$4B,$00,$97,$12,$FF,$FF,$A3
	db $4B,$04,$AB,$12,$97,$12,$AE,$4B,$02,$5F,$12,$63,$12,$B7,$4B,$06
	db $73,$12,$FF,$FF,$BF,$4B,$00,$77,$12,$FF,$FF,$C6,$4B,$00,$7F,$12
	db $FF,$FF,$CD,$4B,$00,$7B,$12,$FF,$FF,$D4,$4B,$02,$E7,$12,$E3,$12
	db $DC,$4B,$02,$FB,$12,$F7,$12,$E5,$4B,$02,$EF,$12,$EB,$12,$F0,$4B
	db $00,$B3,$12,$FF,$FF,$F7,$4B,$00,$D7,$12,$FF,$FF,$08,$48,$00,$67
	db $12,$6B,$12,$01,$4C,$06,$6F,$12,$FF,$FF,$0B,$4C,$02,$DB,$12,$DF
	db $12,$11,$4C,$04,$DB,$12,$DF,$12,$0B,$99,$4B,$00,$AB,$12,$FF,$FF
	db $9E,$4B,$00,$97,$12,$FF,$FF,$A3,$4B,$04,$AB,$12,$97,$12,$D4,$4B
	db $02,$E7,$12,$E3,$12,$DC,$4B,$02,$FB,$12,$F7,$12,$E5,$4B,$02,$EF
	db $12,$EB,$12,$F0,$4B,$00,$B3,$12,$FF,$FF,$F7,$4B,$00,$D7,$12,$FF
	db $FF,$01,$4C,$06,$6F,$12,$FF,$FF,$0B,$4C,$02,$DB,$12,$DF,$12,$11
	db $4C,$04,$DB,$12,$DF,$12
