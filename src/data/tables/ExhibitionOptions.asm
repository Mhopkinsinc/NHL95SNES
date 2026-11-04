ExhibitionOptions:					; the Exhibition setup lines: a count, then per line its title text, value
									; list, variable and routine
	dw 9
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtHomeTeam&$FFFF,TeamValues&$FFFF,HomeTeam,PrintHomeTeamName&$FFFF
	dw TxtVisitingTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtGoalies&$FFFF,GoalieValues&$FFFF,OptGoalie,SaveOptGoalie&$FFFF
	dw TxtUserRecords&$FFFF,UserRecordValues&$FFFF,OptUserRec,SaveOptUserRec&$FFFF
	dw TxtPenalties&$FFFF,PenaltyValues&$FFFF,OptPen,SaveOptPen&$FFFF
	dw TxtLineChanges&$FFFF,LineChangeValues&$FFFF,OptLine,SaveOptLine&$FFFF
	dw TxtRosters&$FFFF,RosterValues&$FFFF,OptRosters,SaveOptRosters&$FFFF
