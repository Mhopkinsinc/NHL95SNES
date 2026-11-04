SetTeamGoalieIndexes:				; SetGoalieIndexRun for the goalies of teams $19 down to 0 (HomeTeam the
									; team)
	lda.w #$0019
NextTeamGoalieIndexes:				; team A (HomeTeam): its goalie count and first player from the team data,
									; then SetGoalieIndexRun
	sta.w HomeTeam
	asl a
	tax
	lda.l $C30000,x
	tax
	phx
	adc.l $C30008,x
	tax
	lda.l $C30000,x
	xba
	ldy.w #$0000
.loop:								; loop: Y + 1, A * 2, A * 2, A * 2, ...
	iny
	asl a
	asl a
	asl a
	asl a
	bne .loop
	plx
	lda.l $C30000,x
	and.w #$07FF
	lsr a
	sec
	sbc.w #$001C
SetGoalieIndexRun:					; Y players from player A get goalie indexes $0A on in their 9-bit SRGoals
									; fields; then the next team (NextTeamGoalieIndexes) while HomeTeam is
									; above 0
	phy
	pha
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	asl a
	adc.b tmp0
	sta.b tmp0
	lsr a
	lsr a
	lsr a
	tax
	lda.b tmp0
	and.w #$0007
	tay
	lda.b $0A
.loop:								; loop: Y - 1, if the result < 0 go to .1, A * 2, go to .loop
	dey
	bmi .1
	asl a
	bra .loop
.1:									; A or SRGoals,x, SRGoals,x = A, $0A + 1, pull A, ...
	ora.l SRGoals,x
	sta.l SRGoals,x
	inc.b $0A
	pla
	inc a
	ply
	dey
	bne SetGoalieIndexRun
	lda.w HomeTeam
	dec a
	bpl NextTeamGoalieIndexes
	rtl
