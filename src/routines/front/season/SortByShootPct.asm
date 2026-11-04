SortByShootPct:						; compare of SortStandingsByStat by shooting percentage (+$16), highest
									; first; back to the sort loop
	lda.w $0016,y
	cmp.w $0016,x
	bcc SortStandingsSwap
	bra SortStandingsKeep
