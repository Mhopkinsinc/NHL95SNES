StandingsPage:						; the NHL Standings text page (StandingsScreen)
	dw $0010,$0100,TxtNHLStandings&$FFFF,$0002
	dw TxtPadUDChangeDivision&$FFFF,$8018
	dw TxtPadLRChangeStat&$FFFF,$8019
	dw $FFFF,$0018
	dw TxtTeam&$FFFF,$8007
	dw 0
