QuitPromptItems:					; the quit prompt: Resume Game, Quit Game, a list for PrintPauseItems: a
									; count, then a routine and a string per item
	dw 2
	dw 0,StrResumeGame&$FFFF
	dw 0,StrQuitGame&$FFFF
