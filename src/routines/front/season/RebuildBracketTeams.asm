RebuildBracketTeams:				; clears bracket work tables and repopulates the playoff teams
	jsl.l WaitTransfers
	lda.w #ScratchBuf
	ldy.w #$1000
	jsl.l ClearRAM7E
	dec.w BracketSlotTeams
	lda.w #$0040
	ldx.w #BracketSlotTeams
	txy
	iny
	mvn $7E,$7E
	jmp.w PopulateBracketTeams
