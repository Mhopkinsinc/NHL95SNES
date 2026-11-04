puckfaceoff:						; assignment (asstab entry 27): the puck at the start of play; PeriodOver
									; when the clock has run out, Stop4Pen for a penalty
	stz.w CrowdLoud
	lda.w shootoutmode
	beq .1
	lda.w shootoutstop
	beq .1
	inc.w shootoutturnover
	rtl
.1:									; puckc = $FFFF, call pucknorm_move, A = pflags,x, ...
	lda.w #$FFFF
	sta.w puckc
	jsl.l pucknorm_move
	lda.w pflags,x
	bit.w #$0002
	bne .2
	jmp.w WaitForFaceoffLineChanges
.2:									; A and $FFFD, pflags,x = A, if gameclock is not 0 go to .3, ...
	and.w #$FFFD
	sta.w pflags,x
	lda.w gameclock
	bne .3
	jml.l PeriodOver
.3:									; A = gmode, if $0040 bits clear go to .4, go to PeriodOver
	lda.w gmode
	bit.w #$0040
	beq .4
	jml.l PeriodOver
.4:									; if gsp is not $0003 go to .5, if tmscore = tmscore+2 go to .5, ...
	lda.w gsp
	cmp.w #$0003
	bne .5
	lda.w tmscore
	cmp.w tmscore+2
	beq .5
	jml.l clockcont_0
.5:									; A = gmode, if $0008 bits clear go to .6, go to Stop4Pen
	lda.w gmode
	bit.w #$0008
	beq .6
	jml.l Stop4Pen
.6:									; call ReturnGoalies, temp1,x = $FFFF, temp2,x = A, ...
	jsl.l ReturnGoalies
	lda.w #$FFFF
	sta.w temp1,x
	sta.w temp2,x
	lda.w OptLine
	bne .7
	jmp.w WaitForFaceoffLineChanges
.7:									; A = penshot, if the result = 0 go to .8, go to WaitForFaceoffLineChanges
	lda.w penshot
	ora.w penshotlive
	beq .8
	jmp.w WaitForFaceoffLineChanges
.8:									; lcpad = $FFFF, lcpad+2 = A, FaceoffLCClosed = 0, ...
	lda.w #$FFFF
	sta.w lcpad
	sta.w lcpad+2
	stz.w FaceoffLCClosed
	stz.w FaceoffLCClosed+2
	lda.w #$0008
	trb.w tmflags
	trb.w tmflags+2
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	beq .9
	lda.l $7E2CF5
	beq .9
	lda.w #$0040
	tsb.w sflags
	jsl.l ClrHor
.9:									; if newperiod is not 0 go to .10, if teampads = 0 go to .10, ...
	lda.w newperiod
	bne .10
	lda.w teampads
	beq .10
	jsl.l HomePadPlayer
	lsr a
	sta.b d0
	jsl.l HomeFaceoffLineChange
.10:								; if newperiod is not 0 go to .11, if teampads+2 = 0 go to .11, ...
	lda.w newperiod
	bne .11
	lda.w teampads+2
	beq .11
	jsl.l AwayPadPlayer
	lsr a
	sta.b d0
	jsl.l AwayFaceoffLineChange
.11:								; newperiod = 0, a1 = 0, a2 = $0002, d0 = A, ...
	stz.w newperiod
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	jsl.l SetFaceoffComputerLine
	jmp.w WaitForFaceoffLineChanges
