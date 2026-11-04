PlayoffTeamAtRound:					; A = the playoff team whose round (SRPOTeamRounds) is A, from the team
									; list at SRPOTeams
	sep #$20
	ldx.w #$0010
.loop:								; loop: X - 1, if A is not SRPOTeamRounds,x go to .loop, ...
	dex
	cmp.l SRPOTeamRounds,x
	bne .loop
	lda.l SRPOTeams,x
	rep #$20
	and.w #$00FF
	rts
