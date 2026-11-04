PlayerInfoPage:						; Create Player's position, weight, number and hand prompts (AnswerNameOk)
	dw $0018,$004B,0,$0000
	dw TxtPosition2&$FFFF,$2008
	dw TxtWeight2&$FFFF,$200B
	dw TxtNumber&$FFFF,$200E
	dw TxtHand&$FFFF,$2011
	dw TxtPadSelect&$FFFF,$8017
	dw TxtXCancel&$FFFF,$8018
	dw TxtStartDone&$FFFF,$8019
	dw 0
