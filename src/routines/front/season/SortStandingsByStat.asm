SortStandingsByStat:				; fills the list at ListBuf with the team records linked from $81, sorted
									; by stat d0 (its compare routine from StandingsSortCompares)
	ldx.w #$0032
.loop:								; loop: ListBuf,x = 0, X - 1, X - 1, if the result >= 0 go to .loop, ...
	stz.w ListBuf,x
	dex
	dex
	bpl .loop
	lda.b d0
	asl a
	tax
	lda.l StandingsSortCompares,x
	sta.b tmp0
	lda.b d0+2
SortStandingsInsert:				; starts inserting team record A into ListBuf and saves its linked-list
									; position
	tax
	stx.b tmp1
	ldy.w #$0000
	bra SortStandingsCompare
