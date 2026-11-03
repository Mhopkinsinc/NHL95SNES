SortByPoints:						; compare of SortStandingsByStat by points (+$A), highest first; back to
									; the sort loop
	lda.w $000A,y
	cmp.w $000A,x
	bcc SortStandingsSwap
	bra SortStandingsKeep
