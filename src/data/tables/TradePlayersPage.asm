TradePlayersPage:					; the Trade Players text page (DrawTradePage)
	dw $0010,$00F0,TxtTradePlayers&$FFFF,$0002
	dw $FFFF,$0020
	dw TxtBSelectPlayer&$FFFF,$8017
	dw TxtYSwitchTeams&$FFFF,$8018
	dw TxtStartEvaluate&$FFFF,$8019
	dw $FFFF,$009B
	dw TxtXCancel&$FFFF,$8017
	dw 0
