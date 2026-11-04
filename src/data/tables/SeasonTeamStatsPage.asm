SeasonTeamStatsPage:				; the Season Team Stats text page (SeasonTeamStats)
	dw $0010,$0100,TxtSeasonTeamStats&$FFFF,$0002
	dw TxtPadSwitchTeams&$FFFF,$8019
	dw $FFFF,$0008
	dw TxtWinsLossesTies&$FFFF,$0009
	dw TxtGoalsScoredAvg&$FFFF,$000B
	dw TxtGoalsAllowedAvg&$FFFF,$000D
	dw TxtSavePct&$FFFF,$000F
	dw TxtShootingPct&$FFFF,$0011
	dw TxtShotsPerGame&$FFFF,$0013
	dw TxtShotsAllowed&$FFFF,$0015
	dw 0
