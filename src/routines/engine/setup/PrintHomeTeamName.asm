PrintHomeTeamName:					; saves HomeTeam (SRHomeTeam) and prints its name, thin and centred
									; between x $A0 and $E8 on row $D; the Home Team lines' routine
	lda.w HomeTeam
	sta.l SRHomeTeam
	jsl.l WaitTransfers
	pei ($CF)
	pei ($D1)
	lda.w #$0360
	jsr.w ClearTeamNameBox
	lda.w #$00A0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	lda.w HomeTeam
PrintSetupTeamName:					; selects row thirteen for the home or visiting team name
	ldy.w #$000D
PrintTeamNameBody:					; prints team A centred on row Y, sends the map and restores the saved
									; margins
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	jsl.l PrintThinCentred
	jsl.l SendTextMap
	pla
	sta.b $D1
	pla
	sta.b $CF
	rts
