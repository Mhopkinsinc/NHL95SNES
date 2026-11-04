PeriodOver:							; end of a period (jumped to when the clock runs out): play turned around,
									; gsp counted with the tie check, Intermission, then StartPer for the next
									; period or the end of the game
	jsl.l FadeOut
	jsl.l forceblack
	lda.w gmode
	eor.w #$0002
	sta.w gmode
	ldy.w #$0000
.loop:								; loop: if tmpdst,y is not $FFFD go to .1, tmpdst,y = $FFFE
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne .1
	lda.w #$FFFE
	sta.w tmpdst,y
.1:									; Y + 1, Y + 1, if Y < $0068 go to .loop, call SetHor, ...
	iny
	iny
	cpy.w #$0068
	bcc .loop
	jsl.l SetHor
	jsl.l setvideo
	inc.w gsp
	lda.w gsp
	cmp.w #$0003
	beq .2
	bcc .3
	lda.w #$0003
	sta.w gsp
	lda.w OptPlayMode
	cmp.w #$0003
	beq .2
	lda.w #$0004
	sta.w gsp
.2:									; if tmscore = tmscore+2 go to .3, gsp = $0004
	lda.w tmscore
	cmp.w tmscore+2
	beq .3
	lda.w #$0004
	sta.w gsp
.3:									; call ResetClock, if gsp is not $0004 go to .5, call UpdateRecords, ...
	jsl.l ResetClock
	lda.w gsp
	cmp.w #$0004
	bne .5
	jsl.l UpdateRecords
	lda.w OptPlayMode
	cmp.w #$0003
	beq .4
	cmp.w #$0002
	bne .5
.4:									; call SimDayScores
	jsr.w SimDayScores
.5:									; call Intermission, if gsp = $0004 go to .6, lastperiod = gsp, ...
	jsl.l Intermission
	lda.w gsp
	cmp.w #$0004
	beq .6
	lda.w gsp
	sta.w lastperiod
	jsl.l FadeOut
	lda.w #$FFFF
	sta.w BA_Sktr_SCnum
	jmp.w StartPer
.6:									; if OptPlayMode = $0003 go to .7, if OptPlayMode = $0002 go to .7, ...
	lda.w OptPlayMode
	cmp.w #$0003
	beq .7
	cmp.w #$0002
	beq .7
	jmp.w Restart
.7:									; call ShowPleaseWait, call SeasonGameOver, call SimDayGameStats, ...
	jsr.w ShowPleaseWait
	jsr.w SeasonGameOver
	jsr.w SimDayGameStats
	lda.w OptPlayMode
	cmp.w #$0003
	beq .8
	jsr.w RecordDayResults
	jsr.w SaveDayGameStats
	bra .9
.8:									; call UpdateDayPlayed
	jsr.w UpdateDayPlayed
.9:									; X = DayGameCount, A = SRDayPlayed
	pea.w $C57E
	plb
	pea.w $007B
	pea.w $9677
	ldx.w DayGameCount
	lda.l SRDayPlayed
.loop2:								; loop: A / 2, if carry clear go to .11, X - 1, ...
	lsr a
	bcc .11
	dex
	bne .loop2
	lda.w OptPlayMode
	cmp.w #$0003
	bne .10
	jml.l RecordPlayoffDay
.10:								; A = SeasonDay, A + 1, SeasonDay = A, SRDayPlayed = $0000, ...
	lda.l SeasonDay
	inc a
	sta.l SeasonDay
	lda.w #$0000
	sta.l SRDayPlayed
	dec a
	sta.b tmp0
	jsl.l StartMenuMusic
	jmp.w ReturnToLeagueMenu
.11:								; go to FinishSeasonDay
	pea.w $7E7F
	plb
	jmp.w FinishSeasonDay
