BracketCursorDown:					; moves the bracket cursor down a row ($69, below 3) by its column's step
									; (BracketDownByColumn)
	lda.b a1+2
	cmp.w #$0003
	bcs BracketCursorUpReturn
	lda.b a1
	asl a
	tax
	jmp (BracketDownByColumn,x)
