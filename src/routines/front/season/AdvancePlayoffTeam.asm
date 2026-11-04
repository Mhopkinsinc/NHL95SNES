AdvancePlayoffTeam:					; the playoff team A one round on (SRPOTeamRounds + 1 in its slot of the
									; list at SRPOTeams)
	sep #$20
	ldx.w #$000F
.loop:								; loop: if A = SRPOTeams,x go to .1, X - 1, ...
	cmp.l SRPOTeams,x
	beq .1
	dex
	bpl .loop
	rep #$21
	rts
.1:									; A = SRPOTeamRounds,x, A + 1, SRPOTeamRounds,x = A, return
	lda.l SRPOTeamRounds,x
	inc a
	sta.l SRPOTeamRounds,x
	rep #$21
	rts
