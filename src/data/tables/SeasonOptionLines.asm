SeasonOptionLines:					; the Season setup lines: a count, then title, value list, variable,
									; routine per line
	dw 7
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtGoalies&$FFFF,GoalieValues&$FFFF,OptGoalie,SaveOptGoalie&$FFFF
	dw TxtPenalties&$FFFF,PenaltyValues&$FFFF,OptPen,SaveOptPen&$FFFF
	dw TxtLineChanges&$FFFF,LineChangeValues&$FFFF,OptLine,SaveOptLine&$FFFF
	dw TxtPlayoffs&$FFFF,PlayoffValues&$FFFF,OptPlayoffs,SaveOptPlayoffs&$FFFF
	dw TxtUserRecords&$FFFF,UserRecordValues&$FFFF,OptUserRec,SaveOptUserRec&$FFFF
