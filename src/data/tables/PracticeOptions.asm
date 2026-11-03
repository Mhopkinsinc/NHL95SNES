PracticeOptions:					; the Practice setup lines: a count, then title, value list, variable,
									; routine per line
	dw 7
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtHomePlayers&$FFFF,PracPlayerValues&$FFFF,homepracplayers,SaveOptHomePracPlayers&$FFFF
	dw TxtVisitorPlayers&$FFFF,PracPlayerValues&$FFFF,awaypracplayers,SaveOptAwayPracPlayers&$FFFF
	dw TxtHomeTeam&$FFFF,TeamValues&$FFFF,HomeTeam,PrintHomeTeamName&$FFFF
	dw TxtVisitingTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtRosters&$FFFF,RosterValues&$FFFF,OptRosters,SaveOptRosters&$FFFF
	db $01,$00,$58,$49,$4C,$58,$02,$19,$00,$00
