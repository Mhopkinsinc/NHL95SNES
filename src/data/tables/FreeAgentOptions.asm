FreeAgentOptions:					; the Free Agent and Release setup lines: a count, then title, value list,
									; variable, routine
	dw 2
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
