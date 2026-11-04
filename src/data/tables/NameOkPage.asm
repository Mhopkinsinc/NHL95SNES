NameOkPage:							; the "is the player name ok" prompt (NameEntry)
	dw $0000,$0100,0,$0000
	dw TxtIsThePlayerNameOk&$FFFF,$400C
	dw TxtYes&$FFFF,$400F
	dw TxtNo&$FFFF,$4012
	dw 0
