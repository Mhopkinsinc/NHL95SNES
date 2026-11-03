BracketRowDown:						; the bracket cursor one row down: BracketCursorCell / BracketWin2Cell +
									; 7, $69 + 1
	inc.b a1+2
	lda.w BracketCursorCell
	adc.w #$0007
	sta.w BracketCursorCell
	sta.w BracketWin2Cell
	rts
