GameStatFormats:					; per game stat row format (the row's byte at +2 in bank $C3): the routine
									; that prints a team's value: a number, a pair, a percentage, a time
	dw DrawTeamStatNumber,DrawTeamStatPair,DrawTeamStatPercent,DrawTeamStatTime
