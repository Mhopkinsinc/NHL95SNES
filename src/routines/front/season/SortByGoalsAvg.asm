SortByGoalsAvg:						; compare of SortStandingsByStat by goals a game (+$10), highest first;
									; back to the sort loop
	lda.w $0010,y
	cmp.w $0010,x
	bcc SortStandingsSwap
	bra SortStandingsKeep
