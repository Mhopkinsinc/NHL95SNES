PauseInfoJumps:						; pause menu Info tab: per item (pauseitem * 2) its routine: Team Roster,
									; Score Summry, Penalties, Records, Other Scores
	dw TeamRoster,ShowScoringSummary,ShowPenaltySummary,RecordHoldersScreen
	dw ShowOtherScores
