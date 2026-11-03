PauseOptionsJumps:					; pause menu Options tab: per item (pauseitem * 2) its routine: Inst
									; Replay, Edit Lines, Chnge Goalie, the goalie mode, Time Out, Quit Game
	dw PauseReplay,LineEditor,Pausemode_go,ManualGoalieMenu
	dw TimeoutMenu,ShowQuitPrompt
