BracketCursorLeft:					; moves the bracket cursor one column left (a1, not below 0)
	lda.b a1
	beq BracketCursorRightReturn
	dec a
	sta.b a1
	lda.w BracketCursorCell
	dec a
	sta.w BracketCursorCell
	sta.w BracketWin2Cell
	rts
