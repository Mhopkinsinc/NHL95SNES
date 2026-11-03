PopulateBracketTeams:				; places playoff teams and their name bars through the rounds they reached
	ldx.w #$000F
.loop:								; loop: A = SRPOTeams,x, A and $00FF, tmp2 = A, A = SRPOTeamRounds,x, ...
	lda.l SRPOTeams,x
	and.w #$00FF
	sta.b tmp2
	lda.l SRPOTeamRounds,x
	and.w #$00FF
	cmp.w #$0004
	bcc .1
	lda.w #$0003
.1:									; tmp3 = A, A = X, tmp1 = X, A * 2, ...
	sta.b tmp3
	txa
	stx.b tmp1
	asl a
	asl a
	asl a
	tax
.loop2:								; loop: A = TeamRoundSlots,x, A * 2, Y = A, BracketSlotTeams,y = tmp2, ...
	lda.l TeamRoundSlots,x
	asl a
	tay
	lda.b tmp2
	sta.w BracketSlotTeams,y
	lda.l TeamBarRoundCells,x
	sta.w BracketTeamBarCells,y
	tay
	lda.b tmp2
	phx
	jsr.w CopyBracketTeamBar
	plx
	inx
	inx
	dec.b tmp3
	bpl .loop2
	ldx.b tmp1
	dex
	bpl .loop
	rts
