SortStandingsKeep:					; restores the list offset when the compare keeps the existing team first
	ply
SortStandingsNextSlot:				; advances to the next word of the sorted list
	iny
	iny
SortStandingsCompare:				; compares against the current list entry or finishes at the first empty
									; slot
	lda.w ListBuf,y
	beq SortStandingsAppend
	phy
	tay
	jmp ($009F)
