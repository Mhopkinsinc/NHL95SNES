BracketUpByColumn:					; per bracket column (a1 * 2): how up moves the cursor: a row in columns 0
									; and 6, to the top row in 1 and 5, not at all in 2-4
	dw BracketRowUp,BracketRowUpToEdge,BracketRowNoMove,BracketRowNoMove
	dw BracketRowNoMove,BracketRowUpToEdge,BracketRowUp
