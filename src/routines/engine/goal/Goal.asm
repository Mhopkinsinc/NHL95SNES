Goal:								; called from other segments
	lda.w gmclock
	beq .1
	stz.w puckvz
	stz.w puckvx
	stz.w puckvy
	rtl
.1:									; if PenShotActive = 0 go to .6, if pucky >= 0 go to .2, A = gmode, ...
	lda.w PenShotActive
	beq .6
	lda.w pucky
	bpl .2
	lda.w gmode
	bit.w #$0002
	beq .5
	bra .3
.2:									; A = gmode, if $0002 bits clear go to .3, go to .5
	lda.w gmode
	bit.w #$0002
	beq .3
	bra .5
.3:									; if BA_Team = 0 go to .6
	lda.w BA_Team
	beq .6
.4:									; call EndPenaltyShot, go to rtsgoal
	jsl.l EndPenaltyShot
	jmp.w rtsgoal
.5:									; if BA_Team = 0 go to .4
	lda.w BA_Team
	beq .4
.6:									; call ChkShotStat, call freezewindow, replaydelay = $001E, a2 = 0, ...
	jsl.l ChkShotStat
	jsl.l freezewindow
	lda.w #$001E
	sta.w replaydelay
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pucky
	bpl .7
	stz.b a1
	lda.w #$0002
	sta.b a2
.7:									; A = gmode, if $0002 bits clear go to .8, a2 = a1, A xor $0002, ...
	lda.w gmode
	bit.w #$0002
	beq .8
	lda.b a1
	sta.b a2
	eor.w #$0002
	sta.b a1
.8:									; Y = a2, A = tmscore,y, A + 1, tmscore,y = A, ...
	ldy.b a2
	lda.w tmscore,y
	inc a
	sta.w tmscore,y
	lda.w tmap
	sec
	sbc.w tmap+2
	beq .11
	bmi .9
	ldy.b a2
	beq .11
	bra .10
.9:									; if a2 is not 0 go to .11
	ldy.b a2
	bne .11
.10:								; A = tmSHGoals,y, A + 1, tmSHGoals,y = A
	lda.w tmSHGoals,y
	inc a
	sta.w tmSHGoals,y
.11:								; if penshot is not 0 go to .12, if breakaway = 0 go to .13, Y = a2, ...
	lda.w penshot
	bne .12
	lda.w breakaway
	beq .13
	ldy.b a2
	lda.w tmBreakawayGoals,y
	inc a
	sta.w tmBreakawayGoals,y
	bra .13
.12:								; Y = a2, A = tmPenShotGoals,y, A + 1, tmPenShotGoals,y = A
	ldy.b a2
	lda.w tmPenShotGoals,y
	inc a
	sta.w tmPenShotGoals,y
.13:								; if onetimer = 0 go to .14, Y = a2, A = tmOneTimerGoals,y, A + 1, ...
	lda.w onetimer
	beq .14
	ldy.b a2
	lda.w tmOneTimerGoals,y
	inc a
	sta.w tmOneTimerGoals,y
.14:								; A = $0009, call QueueSoundCmd, A = $00A2, call StartSound, ...
	lda.w #$0009
	jsl.l QueueSoundCmd
	lda.w #$00A2
	jsl.l StartSound
	stz.w benchcheer
	ldy.b a2
	beq .16
	lda.w #$0004
	jsl.l StartBenchCheer
	lda.l Crowdlevel
	sec
	sbc.w #$0300
	bpl .15
	lda.w #$0000
.15:								; Crowdlevel = A, go to .17
	sta.l Crowdlevel
	bra .17
.16:								; A + 1, A + 1, call StartBenchCheer, A = Crowdlevel, ...
	inc a
	inc a
	jsl.l StartBenchCheer
	lda.l Crowdlevel
	clc
	adc.w #$01F4
	sta.l Crowdlevel
	lda.w #$0078
	sta.b crowdhold
	lda.w #$0003
	jsl.l PlayTeamSongNow
.17:								; sfxmutetime = Vcount, call EndPenaltyShot, breakaway = 0, ...
	lda.b Vcount
	sta.w sfxmutetime
	jsl.l EndPenaltyShot
	stz.w breakaway
	stz.w onetimer
	phx
	lda.w gsp
	asl a
	asl a
	tax
	lda.w CwdExciteLvl
	clc
	adc.w #$001E
	bmi .18
	sta.w CwdExciteLvl
.18:								; if a2 = 0 go to .19, X + 1, X + 1, A = CwdExciteLvl, ...
	lda.b a2
	beq .19
	inx
	inx
	lda.w CwdExciteLvl
	clc
	adc.w #$FFCE
	bmi .19
	sta.w CwdExciteLvl
.19:								; A = tmPerGoals,x, A + 1, tmPerGoals,x = A, pull X, ...
	lda.w tmPerGoals,x
	inc a
	sta.w tmPerGoals,x
	plx
	lda.w ScoreSumbytes
	cmp.w #$0258
	bne .20
	sec
	sbc.w #$0006
	sta.w ScoreSumbytes
.20:								; a0+2 = $007E, A = ScoreSum, A + ScoreSumbytes, a0 = A, ...
	lda.w #$007E
	sta.b a0+2
	lda.w #ScoreSum
	clc
	adc.w ScoreSumbytes
	sta.b a0
	lda.w ScoreSumbytes
	adc.w #$0006
	sta.w ScoreSumbytes
	jsl.l GetPeriodTimeRemaining
	lda.b d0
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$0002
	clc
	ldy.b a2
	adc.w tmap,y
	ldy.b a1
	sec
	sbc.w tmap,y
	ldy.b a2
	beq .21
	ora.w #$0080
.21:								; [a0] = A, a0 + 1, d0 = tmtouch1,y, [a0] = A, ...
	sta.b [a0]
	inc.b a0
	lda.w tmtouch1,y
	sta.b d0
	sta.b [a0]
	inc.b a0
	lda.w #$FFFF
	sta.b [a0]
	ldx.b a2
	lda.w tmgoalie,x
	cmp.b d0
	beq .23
	lda.b a2
	beq .22
	lda.w #$001A
.22:								; A + d0, X = A, A 8-bit, tmgoals,x + 1, ...
	clc
	adc.b d0
	tax
	sep #$20
	inc.w tmgoals,x
	rep #$20
.23:								; Y = a2, d0 = tmtouch2,y, if tmtouch2,y < 0 go to .26, A 8-bit, ...
	ldy.b a2
	lda.w tmtouch2,y
	sta.b d0
	bmi .26
	sep #$20
	sta.b [a0]
	rep #$20
	lda.b a2
	beq .24
	lda.w #$001A
.24:								; A + d0, X = A, A 8-bit, tmassists,x + 1, ...
	clc
	adc.b d0
	tax
	sep #$20
	inc.w tmassists,x
	rep #$20
	inc.b a0
	lda.w tmtouch3,y
	sta.b d0
	bmi .26
	sep #$20
	sta.b [a0]
	rep #$20
	lda.b a2
	beq .25
	lda.w #$001A
.25:								; A + d0, X = A, A 8-bit, tmassists,x + 1, ...
	clc
	adc.b d0
	tax
	sep #$20
	inc.w tmassists,x
	rep #$20
.26:								; Y = a1, d0 = tmgoalie,y, if tmgoalie,y < 0 go to .28, ...
	ldy.b a1
	lda.w tmgoalie,y
	sta.b d0
	bmi .28
	lda.b a1
	beq .27
	lda.w #$001A
.27:								; A + d0, X = A, tmgoals,x + 1
	clc
	adc.b d0
	tax
	inc.w tmgoals,x
.28:								; call PenGoalStuff, call DrawScoreBox, X = a3, d0 = $0008, ...
	jsl.l PenGoalStuff
	jsl.l DrawScoreBox
	ldx.b a3
	lda.w #$0008
	sta.b d0
	jsl.l AssignTeam
	lda.b a2
	bne .29
	lda.w tmscore+2
	sec
	sbc.w tmscore
	bmi .29
	cmp.w #$0003
	bcs .29
.29:								; collflag = 0, puckvx = 0, puckvy = 0, Y = $0006, ...
	stz.w collflag
	stz.w puckvx
	stz.w puckvy
	ldy.w #$0006
	lda.w puckx
	bpl .30
	ldy.w #$FFFA
.30:								; puckx = Y, Y = $0116, if pucky >= 0 go to .31, Y = $FEEA
	sty.w puckx
	ldy.w #$0116
	lda.w pucky
	bpl .31
	ldy.w #$FEEA
.31:								; pucky = Y, puckvz = $0600, puckz = 0, puckcross+2 = $FFFF, ...
	sty.w pucky
	lda.w #$0600
	sta.w puckvz
	stz.w puckz
	lda.w #$FFFF
	sta.w puckcross+2
	sta.w puckcross+6
	sta.w pfnc+28
	lda.w #$001A
	sta.b d0
	jsl.l assreplace
	inx
	inx
	lda.w #SPAsiren&$FFFF
	jsl.l SetSPAFromA
	ldy.b a2
	ldx.w tmsort,y
	stx.b a3
	lda.w #$000E
	sta.b d0
	jsl.l AddPenalty2
	ldx.w #$001C
	stx.b a3
	rtl
