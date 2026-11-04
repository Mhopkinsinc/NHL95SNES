BracketCursorRight:					; moves the bracket cursor one column right (a1, at most 6)
	lda.b a1
	inc a
	cmp.w #$0007
	bcs BracketCursorRightReturn
	sta.b a1
	lda.w BracketCursorCell
	inc a
	sta.w BracketCursorCell
	sta.w BracketWin2Cell
BracketCursorRightReturn:			; the rts BracketCursorRight ends with, shared by BracketCursorLeft
	rts
