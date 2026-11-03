EvenStrengthLines:					; per score state (rows of 7 words: tied or before the third period, then
									; leading, trailing) and the other team's line (tmline * 2): the line to
									; send
	db $00,$00,$01,$00,$02,$00,$00,$00,$01,$00,$00,$00,$01,$00,$02,$00
	db $00,$00,$01,$00,$02,$00,$00,$00,$02,$00,$00,$00,$00,$00,$01,$00
	db $00,$00,$00,$00,$01,$00,$00,$00,$01,$00
