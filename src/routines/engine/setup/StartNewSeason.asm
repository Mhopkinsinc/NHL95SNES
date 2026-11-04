StartNewSeason:						; play mode 7 (Start New's Erase Team Rosters question): play mode Season,
									; the season data cleared (ClearSeasonData), then the League Menu
									; (EnterLeagueMenu)
	lda.w #$0002
	sta.w OptPlayMode
	jsl.l ClearSeasonData
	jmp.w EnterLeagueMenu
