PauseInfoJumps:						; pause menu Info tab: per item (pauseitem * 2) its routine: Team Roster,
									; Score Summry, Penalties, Records, Other Scores
	dw TeamRosterScreen,ScoringSummaryScreen,PenaltySummaryScreen,RecordHoldersScreen
	dw ShowOtherScores
