CreatePlayerPage:					; the Create Player text page (DrawNameEntry)
	dw $0010,$0100,TxtCreatePlayer&$FFFF,$0002
	dw $FFFF,$000D
	dw TxtFirstName&$FFFF,$0006
	dw $FFFF,$0014
	dw TxtLastName&$FFFF,$0008
	dw $FFFF,$0020
	dw TxtPadToALetter&$FFFF,$8016
	dw TxtBToSelect&$FFFF,$8017
	dw TxtYToGoBack&$FFFF,$8018
	dw TxtXCancel&$FFFF,$8019
	dw TxtStartWhenDone&$FFFF,$801A
	dw 0
