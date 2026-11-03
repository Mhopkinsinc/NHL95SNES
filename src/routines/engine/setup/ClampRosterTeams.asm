ClampRosterTeams:					; keeps HomeTeam and VisTeam among the 26 NHL teams (else $E / $17, saved
									; and redrawn)
	lda.w HomeTeam
	cmp.w #$001A
	bcc .1
	lda.w #$000E
	sta.w HomeTeam
	sta.l SRHomeTeam
	jsr.w PrintHomeTeamName
.1:									; if VisTeam < $001A go to ClampRosterTeamsReturn, VisTeam = $0017, ...
	lda.w VisTeam
	cmp.w #$001A
	bcc ClampRosterTeamsReturn
	lda.w #$0017
	sta.w VisTeam
	sta.l SRVisTeam
	jmp.w PrintVisTeamName
