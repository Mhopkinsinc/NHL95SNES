SortStandingsSwap:					; replaces the current slot and carries the displaced record forward
	txa
	tyx
	ply
	sta.w ListBuf,y
	bra SortStandingsNextSlot
