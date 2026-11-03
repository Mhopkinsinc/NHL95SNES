ClearSeasonData:					; clears the season in save RAM (SeasonDay and the day, result and stat
									; blocks, the team stats, the playoffs); with OptEraseRosters also the
									; created players, then SRPlayerTeams rebuilt; then the goalie indexes
	phb
	lda.w #$0000
	sta.l SeasonDay
	ldx.w #SeasonDay&$FFFF
	ldy.w #(SeasonDay+2)&$FFFF
	lda.w #$09C3
	mvn $30,$30
	ldx.w #SRTeamStats&$FFFF
	ldy.w #(SRTeamStats+2)&$FFFF
	lda.w #$0290
	stz.w $0000,x
	mvn $30,$30
	ldx.w #SRPOGoals&$FFFF
	ldy.w #(SRPOGoals+2)&$FFFF
	lda.w #$0622
	stz.w $0000,x
	mvn $30,$30
	lda.l $001902
	beq .1
	lda.w #$0183
	ldx.w #SRCreatedPlayers&$FFFF
	ldy.w #(SRCreatedPlayers+2)&$FFFF
	stz.w $0000,x
	mvn $30,$30
	lda.w #$03EA
	ldx.w #SRPlayerTeams&$FFFF
	ldy.w #(SRPlayerTeams+2)&$FFFF
	stz.w $0000,x
	mvn $30,$30
	jsr.w InitPlayerTeams
	jsr.w ClearCreatedPlayerTeams
.1:									; call SetGoalieIndexes, call ClearCreatedGoals, return
	jsl.l SetGoalieIndexes
	jsl.l ClearCreatedGoals
	plb
	rtl
