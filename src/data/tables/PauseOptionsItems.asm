PauseOptionsItems:					; the Options tab: Inst Replay, Edit Lines, Chnge Goalie, goalie mode,
									; timeout, Quit Game, a list for PrintPauseItems: a count, then a routine
									; and a string per item
	dw 6
	dw 0,StrInstReplay&$FFFF
	dw 0,StrEditLines&$FFFF
	dw 0,StrChngeGoalie&$FFFF
	dw GoalieModeItemText&$FFFF,0
	dw TimeoutItemText&$FFFF,0
	dw 0,StrQuitGame&$FFFF
