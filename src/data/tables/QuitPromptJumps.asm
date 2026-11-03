QuitPromptJumps:					; the quit prompt: per item (pauseitem * 2) its routine: Resume Game (back
									; to the Options tab), Quit Game
	dw ResumeFromQuit,QuitGameJump
