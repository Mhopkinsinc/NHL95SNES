SortByGoalsAllowed:					; compare of SortStandingsByStat by goals allowed a game (+$12), lowest
									; first; back to the sort loop
	lda.w $0012,x
	cmp.w $0012,y
	bcc SortStandingsSwap
	bra SortStandingsKeep
