SortBySavePct:						; compare of SortStandingsByStat by save percentage (+$14), highest first;
									; back to the sort loop
	lda.w $0014,y
	cmp.w $0014,x
	bcc SortStandingsSwap
	bra SortStandingsKeep
