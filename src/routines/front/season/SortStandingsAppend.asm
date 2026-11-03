SortStandingsAppend:				; fills the empty slot and starts inserting the next linked team record
	txa
	sta.w ListBuf,y
	ldx.b tmp1
	lda.w $0002,x
	bne SortStandingsInsert
	rts
