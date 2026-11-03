StandingsColumnTexts:				; per standings column (d0 * 2): the routine that writes the team's value
									; in mesarea: record, points, goals and goals allowed a game, save and
									; shooting percentage, shots and shots allowed a game
	dw TeamRecordText,TeamPointsText,TeamGoalsAvgText,TeamGoalsAllowedText
	dw TeamSavePctText,TeamShootPctText,TeamShotsAvgText,TeamShotsAllowedText
