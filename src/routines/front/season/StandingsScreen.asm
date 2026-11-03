StandingsScreen:					; League Menu NHL Standings: the teams of a division (pad up / down
									; changes the division, left / right the stat)
	jsl.l FadeOutWait
	ldx.b a0
	lda.w #$FC18
	sta.b $05,x
	sta.b $08,x
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5C00
	jsl.l ClearVRAM
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #StandingsPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	stz.b d0
	jsl.l BuildAllTeamRecords
	stz.b d1
DrawStandings:						; draws the standings page: the teams of division d1 sorted by stat d0 as
									; a scrolling list (DrawStandingsRow a row), the stat's title and the
									; division's name; screen state 11
	jsr.w SortStandingsByStat
	jsr.w KeepDivisionTeams
	stz.b a1+2
	lda.w #DrawStandingsRow
	ldx.w #$000D
	ldy.w #$0009
	jsr.w StartScrollList
	lda.b d0
	asl a
	tax
	lda.l StandingsStatTitles,x
	tax
	ldy.w #$0007
	lda.w #$00F0
	sta.b $D1
	jsl.l PrintBoldRight
	lda.w #$0010
	sta.b $CF
	lda.b d1
	asl a
	tax
	lda.l DivisionNames,x
	tax
	ldy.w #$0013
	jsl.l PrintItalicCentred
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$000B
	sta.b d6+2
	stz.w fadein
	rts
