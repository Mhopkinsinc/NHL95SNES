PlayModeStarts:						; per play mode (OptPlayMode * 2): the routine start / select runs in the
									; setup screen: Exhibition, Practice, Season, Trades, Free Agent, Release,
									; Make Player, StartNewSeason
	dw StartExhibition,StartPractice,StartSeason,TradePlayers
	dw SignFreeAgents,ReleasePlayers,CreatePlayer,StartNewSeason
