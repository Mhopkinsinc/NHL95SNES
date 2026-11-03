BracketRowUp:						; the bracket cursor one row up: BracketCursorCell / BracketWin2Cell - 7,
									; $69 - 1
	sec
	lda.w BracketCursorCell
	sbc.w #$0007
	sta.w BracketCursorCell
	sta.w BracketWin2Cell
	dec.b a1+2
	rts
