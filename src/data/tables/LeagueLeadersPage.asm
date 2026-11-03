LeagueLeadersPage:					; the League Leaders text page (DrawLeagueLeaders)
	dw $0010,$0100,TxtLeagueLeaders&$FFFF,$0002
	dw $FFFF,$0018
	dw TxtPlayerNoTm&$FFFF,$8007
	dw TxtPADChangeStats&$FFFF,$8019
	dw 0
