EditLinesPage:						; the Edit Lines text page (LineEditor)
	dw $0010,$00F0,TxtEditLines&$FFFF,$0002
	dw TxtPadLRChangeLine&$FFFF,$8017
	dw TxtPadUDChangePlayer&$FFFF,$8018
	dw TxtBSelectPlayer&$FFFF,$8019
	dw 0
