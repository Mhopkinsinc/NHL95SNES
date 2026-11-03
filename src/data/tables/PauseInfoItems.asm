PauseInfoItems:						; the Info tab: Team Roster, Score Summry, Penalties, Records, the other
									; scores, a list for PrintPauseItems: a count, then a routine and a string
									; per item
	dw 5
	dw 0,StrTeamRoster&$FFFF
	dw 0,StrScoreSummry&$FFFF
	dw 0,StrPenalties&$FFFF
	dw 0,StrRecords&$FFFF
	dw OtherScoresItemText&$FFFF,0
