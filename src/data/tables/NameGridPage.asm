NameGridPage:						; the name entry grid's help text page (DrawNameGrid)
	dw $0010,$00F0,0,$0000
	dw TxtPadToALetter&$FFFF,$8018
	dw TxtBToSelect&$FFFF,$8019
	dw TxtYToGoBack&$FFFF,$801A
	dw $FFFF,$0087
	dw TxtStartWhenDone&$FFFF,$8019
	dw TxtXCancel&$FFFF,$801A
	dw 0
