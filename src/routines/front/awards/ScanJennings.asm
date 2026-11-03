ScanJennings:						; Jennings Trophy: from the team FindFewestGoalsAllowedTeam picks, the
									; goalie with the most season games (SeasonGoalieGamesLong)
	stz.b a2
	jsr.w FindFewestGoalsAllowedTeam
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
	stz.b a2
.loop:								; loop: A = HomeRoster+2, A - 1, if the result < 0 go to .1, ...
	lda.w HomeRoster+2
	dec a
	bmi .1
	sta.w HomeRoster+2
	asl a
	tax
	lda.w HomeRoster+58,x
	sta.b a3
	jsl.l SeasonGoalieGamesLong
	lda.b tmp0
	cmp.b a2
	bcc .loop
	sta.b a2
	lda.b a3
	sta.b a3+2
	bra .loop
.1:									; A = a3+2, return
	lda.b a3+2
	rts
