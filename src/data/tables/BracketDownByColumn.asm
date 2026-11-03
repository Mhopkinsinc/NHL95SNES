BracketDownByColumn:				; per bracket column (a1 * 2): how down moves the cursor: a row in columns
									; 0 and 6, to the bottom row in 1 and 5, not at all in 2-4
	dw BracketRowDown,BracketRowDownToEdge,BracketRowNoMove,BracketRowNoMove
	dw BracketRowNoMove,BracketRowDownToEdge,BracketRowDown
