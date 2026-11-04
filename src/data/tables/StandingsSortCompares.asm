StandingsSortCompares:				; per standings column (d0 * 2): the compare routine of
									; SortStandingsByStat's sort (points for the first two)
	dw SortByPoints,SortByPoints,SortByGoalsAvg,SortByGoalsAllowed
	dw SortBySavePct,SortByShootPct,SortByShotsAvg,SortByShotsAllowed
