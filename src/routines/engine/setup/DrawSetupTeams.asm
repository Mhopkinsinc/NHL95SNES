DrawSetupTeams:						; the setup screen's teams: both colour sets queued, two tile blocks, the
									; home and visiting logo sprites (d7, $9D) and both names
									; (PrintHomeTeamName, PrintVisTeamName)
	stz.b $22
	stz.b $24
	lda.w #$00C0
	sta.b $18
	lda.w #$0040
	sta.b $1A
	jsr.w QueueHomePalette
	jsr.w QueueVisPalette
	jsl.l WaitTransfers
	ldy.w #$2801
	ldx.w #$5194
	jsl.l MapTileBlock
	ldy.w #$2C01
	ldx.w #$5184
	jsl.l MapTileBlock
	lda.w HomeTeam
	jsl.l CreateSprite
	stx.b d7
	lda.w #$0040
	sta.b $18
	lda.w VisTeam
	jsl.l CreateSprite
	stx.b d7+2
	inc.b $38,x
	jsr.w PrintHomeTeamName
	jmp.w PrintVisTeamName
