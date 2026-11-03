BracketRowDownToEdge:				; repeats downward row movement until the bottom edge
	jsr.w BracketRowDown
	bra BracketCursorDown
