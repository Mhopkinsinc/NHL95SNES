PauseTabLists:						; per pause tab (pausetab * 2: Info, Stats, Options, the quit prompt): its
									; item list in bank $C3 for DrawPauseItems
	dw PauseInfoItems&$FFFF,PauseStatsItems&$FFFF,PauseOptionsItems&$FFFF,QuitPromptItems&$FFFF
