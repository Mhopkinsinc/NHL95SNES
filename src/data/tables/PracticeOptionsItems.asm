PracticeOptionsItems:				; the Options tab in practice: Inst Replay, Quit Game, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 2
	dw 0,StrInstReplay&$FFFF
	dw 0,StrQuitGame&$FFFF
