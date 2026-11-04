BracketCursorUp:					; moves the bracket cursor up a row ($69) by its column's step
									; (BracketUpByColumn)
	lda.b a1+2
	beq BracketCursorUpReturn
	lda.b a1
	asl a
	tax
	jmp (BracketUpByColumn,x)
