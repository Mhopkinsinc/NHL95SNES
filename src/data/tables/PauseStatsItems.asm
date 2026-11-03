PauseStatsItems:					; the Stats tab: Game Stats, Period Stats, Player Stats, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 3
	dw 0,StrGameStats&$FFFF
	dw 0,StrPeriodStats&$FFFF
	dw 0,StrPlayerStats&$FFFF
