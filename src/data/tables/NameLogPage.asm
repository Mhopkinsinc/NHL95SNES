NameLogPage:						; the Name Entry list's text page (DrawNameLog)
	dw $0010,$00F0,TxtNameEntry&$FFFF,$0002
	dw TxtBEditName&$FFFF,$8019
	dw TxtStartSelectPlayer&$FFFF,$801A
	dw 0
