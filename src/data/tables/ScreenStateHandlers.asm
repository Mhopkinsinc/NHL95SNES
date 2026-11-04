ScreenStateHandlers:				; per front end screen state ($99): its handler, run each frame by
									; ScreenStateLoop: the Create Player pages, then the season screens
	dw NameEntry,NameEntry,AskNameOk,EditPlayerInfo
	dw ModifyRatings,NameEntryReturn,SeasonOptionsInput,GamesTodayInput
	dw LeagueLeadersInput,SeasonTeamStatsInput,SeasonPlayerStatsInput,StandingsInput
	dw NoGameSelectedInput,StartSeasonInput
