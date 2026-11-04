SwapRosterPlayers:					; swaps the roster entries at X and Y (the id at +8 and the index at +$3A)
	lda.w $0008,x
	pha
	lda.w $003A,x
	pha
	lda.w $0008,y
	sta.w $0008,x
	lda.w $003A,y
	sta.w $003A,x
	pla
	sta.w $003A,y
	pla
	sta.w $0008,y
	rts
