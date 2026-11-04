InitSavedRosters:					; InitPlayerTeams, ClearCreatedPlayerTeams, then SetGoalieIndexes
	jsr.w InitPlayerTeams
	jsr.w ClearCreatedPlayerTeams
SetGoalieIndexes:					; numbers the goalies in SRGoals: each team's goalies
									; (SetTeamGoalieIndexes), then the 20 created player slots from player
									; $26A, indexes 0 up ($0A)
	pea.w $7E7E
	plb
	plb
	stz.b $0A
	jsl.l SetTeamGoalieIndexes
	ldy.w #$0014
	lda.w #$026A
	jmp.w SetGoalieIndexRun
