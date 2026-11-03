SeasonMenuJumps:					; the routine of each League Menu item: Play Games, NHL Standings, Games
									; Today, League Leaders, Team Stats, Player Stats
	dw MenuPlayGames,StandingsScreen,GamesToday,LeagueLeadersScreen
	dw SeasonTeamStats,SeasonPlayerStats
