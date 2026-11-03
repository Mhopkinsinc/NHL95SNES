BracketMarkSeries:					; toggles BracketSeriesMarks for the selected series when
									; both teams are known and it is not decided, and highlights its teams'
									; bars
	lda.w BracketCursorCell
	asl a
	tax
	lda.l BracketCellSeries,x
	tay
	asl a
	tax
	lda.w BracketSlotTeams,x
	ora.w BracketSlotTeams+$1E,x
	bmi .rts
	tyx
	lda.l SRPOWins,x
	and.w #$00FF
	cmp.w #$0040
	bcs .rts
	and.w #$000F
	cmp.w #$0004
	bcs .rts
	tya
	asl a
	tax
	lda.w BracketSeriesMarks&$FFFF,x
	eor.w #$FFFF
	sta.w BracketSeriesMarks&$FFFF,x
	ldy.w BracketTeamBarCells,x
	phx
	jsr.w ToggleTeamBarHighlight
	plx
	ldy.w BracketTeamBarCells+$1E,x
	jsr.w ToggleTeamBarHighlight
	jmp.w RefreshBracketColumns
.rts:								; return
	rts
