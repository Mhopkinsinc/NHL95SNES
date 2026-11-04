SortByShotsAllowed:					; compare of SortStandingsByStat by shots allowed a game (+$30), lowest
									; first; back to the sort loop
	lda.w $0030,x
	cmp.w $0030,y
	bcc SortStandingsSwap
	bra SortStandingsKeep
