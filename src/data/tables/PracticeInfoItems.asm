PracticeInfoItems:					; the Info tab in practice: Team Roster, Score Summry, Records, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 3
	dw 0,StrTeamRoster&$FFFF
	dw 0,StrScoreSummry&$FFFF
	dw 0,StrRecords&$FFFF
