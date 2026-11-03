SortByShotsAvg:						; compare of SortStandingsByStat by shots a game (+$1A), highest first;
									; back to the sort loop
	lda.w $001A,y
	cmp.w $001A,x
	bcc SortStandingsSwap
	bra SortStandingsKeep
