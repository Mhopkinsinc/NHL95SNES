TradeOptions:						; the Trades setup lines: a count, then title, value list, variable,
									; routine per line
	dw 3
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtTeam1&$FFFF,TeamValues&$FFFF,HomeTeam,TradeTeam1Hook&$FFFF
	dw TxtTeam2&$FFFF,TeamValues&$FFFF,VisTeam,TradeTeam2Hook&$FFFF
