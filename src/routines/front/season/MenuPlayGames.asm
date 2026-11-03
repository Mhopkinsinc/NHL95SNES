MenuPlayGames:						; League Menu Play Games: when the season is over (play mode 3), the end
									; of season (BuildPlayoffDay); else the day's games from the schedule
	stz.b tmp0
	lda.w OptPlayMode
	cmp.w #$0003
	bne .1
	jml.l BuildPlayoffDay
.1:									; A = SeasonDay, A and $00FF, d0 = A, call DayFirstGame, ...
	lda.l SeasonDay
	and.w #$00FF
	sta.b d0
	jsr.w DayFirstGame
	lda.b d4
	and.w #$0007
	tax
	lda.b d4
	lsr a
	lsr a
	lsr a
	tay
	lda.w #$0002
	sta.w OptPlayMode
	lda.l SeasonDay
	and.w #$00FF
	asl a
	tax
	lda.l SeasonDates,x
	bne .2
	jsl.l SetupPlayoffs
	inc.w OptPlayMode
	jmp.w ReturnToLeagueMenu
.2:									; A = d0, A * 2, X = A, A = SeasonSchedule,x, ...
	lda.b d0
	asl a
	tax
	lda.l SeasonSchedule,x
	tax
	lda.l $C30000,x
	and.w #$00FF
	sta.w DayGameCount
	sta.b tmp0
	pea.w $7E7F
	plb
	ldy.w #$8EF8
.loop:								; loop: A = $C30001,x, A and $00FF, $0002,y = A, A = $C30002,x, ...
	lda.l $C30001,x
	and.w #$00FF
	sta.w $0002,y
	lda.l $C30002,x
	and.w #$00FF
	sta.w $0004,y
	lda.w #$0000
	sta.w $0006,y
	sta.w $0008,y
	sta.w $000A,y
	phx
	lda.b d4
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	sta.b tmp1
	lda.b d4
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRUserGames,x
	ldx.w #$0000
	and.b tmp1
	beq .3
	inx
.3:									; A = X, $0000,y = A, pull X, d4 + 1, ...
	txa
	sta.w $0000,y
	plx
	inc.b d4
	inx
	inx
	tya
	clc
	adc.w #$010A
	tay
	dec.b tmp0
	bne .loop
	lda.l SRDayPlayed
	beq FinishSeasonDay
	jsr.w RestoreDayScores
FinishSeasonDay:					; once no user game of the day is left: Please Wait, the computer games
									; simulated (SimDayScores, SimDayGameStats), the other scores shown, the
									; results and season stats saved, the season day + 1
	lda.l $7E2C42
	sta.b tmp0
	lda.w #$8EF8
	clc
.loop:								; loop: X = A, if $0000,x is not 0 go to .3, A = X, A + $010A, ...
	tax
	lda.w $0000,x
	bne .3
	txa
	adc.w #$010A
	dec.b tmp0
	bne .loop
	plb
	jsr.w ShowPleaseWait
	jsr.w SimDayScores
	jsr.w SimDayGameStats
	jsl.l ResetWorkBuf
	lda.w #$0001
	sta.w SeasonScoresMode
	stz.w SeasonScoresExit
	jsl.l ResetSprites
	jsr.w ShowOtherScores
	stz.w SeasonScoresMode
	jsl.l ResetTransferQueues
	lda.w OptPlayMode
	cmp.w #$0003
	bne .1
	jml.l RecordPlayoffDay
.1:									; call RecordDayResults, call SaveDayGameStats, A = SeasonDay, A + 1, ...
	jsr.w RecordDayResults
	jsr.w SaveDayGameStats
	lda.l SeasonDay
	inc a
	sta.l SeasonDay
	lda.w #$0000
	sta.l SRDayPlayed
	bit.w SeasonScoresExit
	bpl .2
	jmp.w ReturnToLeagueMenu
.2:									; go to MenuPlayGames
	jmp.w MenuPlayGames
.3:									; HomeTeam = $0004,x, A = $0002,x, VisTeam = A, ...
	lda.w $0004,x
	sta.l HomeTeam
	lda.w $0002,x
	plb
	sta.w VisTeam
	stx.w SeasonUserGamePtr
	jsl.l ResetTransferQueues
	jsl.l ResetWorkBuf
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	wai
	jsr.w SetupScreen
	jsl.l ResetSprites
	lda.w #$FFFA
	sta.w BG2VScroll
	jsr.w DrawSetupTeams
	sep #$20
	lda.b #$17
	sta.l TM
	rep #$20
	stz.b a0
	stz.b a4
	stz.b $75
	pla
	jmp.w StartExhibition
