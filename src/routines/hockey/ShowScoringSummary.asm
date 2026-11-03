ShowScoringSummary:					; pause menu Score Summry: the goals of the game (Per, Time, Tm, Goal /
									; Ass., P/S) as a scrolling list, No Scoring when there are none; start
									; returns
	lda.w #$535B
	jsr.w SetupStatsPage
	lda.w #$0010
	sta.b $CF
	ldx.w #TxtPer&$FFFF
	jsr.w PrintScoringHead
	lda.w #$002E
	sta.b $CF
	ldx.w #TxtTime&$FFFF
	jsr.w PrintScoringHead
	lda.w #$0054
	sta.b $CF
	ldx.w #TxtTm&$FFFF
	jsr.w PrintScoringHead
	lda.w #$0080
	sta.b $CF
	ldx.w #TxtGoalAss&$FFFF
	jsr.w PrintScoringHead
	lda.w #$00E0
	sta.b $CF
	ldx.w #TxtPS&$FFFF
	jsr.w PrintScoringHead
	lda.w ScoreSumbytes
	lsr a
	sta.b a1
	bne .1
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w #$2400
	sta.b $D5
	ldx.w #TxtNoScoring&$FFFF
	ldy.w #$0011
	jsl.l PrintBoldCentred
	lda.w #$2000
	sta.b $D5
	bra .2
.1:									; A = DrawScoringRow, X = $0006, Y = $0012, call StartScrollList
	lda.w #DrawScoringRow
	ldx.w #$0006
	ldy.w #$0012
	jsr.w StartScrollList
.2:									; call SendTextMap, fadestep = 0
	jsl.l SendTextMap
	stz.w fadestep
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
	jsl.l ReadMenuPads
	inc.b $26
	lda.b a1
	beq .3
	jsr.w ScrollListArrows
.3:									; call AnimateSprites, $28 = OAMBuf+$1FF, $2A = OAMHighBytes, ...
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w repeatdelayframes
	bne .loop
	lda.w padchangeany
	bit.w #$1000
	bne .6
	ldx.b a1
	beq .loop
	bit.w #$0800
	beq .4
	jsr.w ScrollListUp
	bra .loop
.4:									; if $0400 bits clear go to .5, call ScrollListDown, go to .loop
	bit.w #$0400
	beq .5
	jsr.w ScrollListDown
	bra .loop
.5:									; go to .loop
	bra .loop
.6:									; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu
