PrintVisTeamName:					; saves VisTeam (SRVisTeam) and prints its name, thin and centred between
									; x $20 and $68 on row $D; the Visiting Team lines' routine
	lda.w VisTeam
	sta.l SRVisTeam
	jsl.l WaitTransfers
	pei ($CF)
	pei ($D1)
	lda.w #$0340
	jsr.w ClearTeamNameBox
	lda.w #$0020
	sta.b $CF
	lda.w #$0068
	sta.b $D1
	lda.w VisTeam
	jmp.w PrintSetupTeamName
