SetupScreenStates:					; per setup screen state ($99): its routine each frame: the logo update,
									; or a scroll of the list up / down
	dw UpdateTeamLogos,SetupScrollUp,SetupScrollDown
