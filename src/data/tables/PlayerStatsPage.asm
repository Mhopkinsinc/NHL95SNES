PlayerStatsPage:					; the Player Stats text page (ShowPlayerStats)
	dw $0010,$00F0,TxtPlayerStats&$FFFF,$0002
	dw $FFFF,$0020
	dw TxtYSwitchTeams&$FFFF,$801A
	dw 0
	db $10,$00,$F0,$00,$21,$4C,$02,$00,$D6,$47,$07,$C0,$00,$00,$10,$00
	db $F0,$00,$37,$4C,$02,$00,$D6,$47,$07,$C0,$00,$00
