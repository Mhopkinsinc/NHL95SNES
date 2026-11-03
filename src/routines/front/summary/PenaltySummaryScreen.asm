PenaltySummaryScreen:				; pause menu Penalties: the penalties of the game (Per, Time, Tm, Player,
									; PM) as a scrolling list, No Penalties when there are none; start returns
	lda.w #$534D
	jsr.w SetupStatsPage
	lda.w #$0010
	sta.b $CF
	lda.w #$0030
	sta.b $D1
	ldx.w #TxtPer&$FFFF
	jsr.w PrintPenaltyHead
	lda.w #$0060
	sta.b $D1
	ldx.w #TxtTime&$FFFF
	jsr.w PrintPenaltyHead
	lda.w #$0080
	sta.b $D1
	ldx.w #TxtTm&$FFFF
	jsr.w PrintPenaltyHead
	lda.w #$00E0
	sta.b $D1
	ldx.w #TxtPlayer&$FFFF
	jsr.w PrintPenaltyHead
	lda.w #$00F8
	sta.b $D1
	ldx.w #TxtPM&$FFFF
	jsr.w PrintPenaltyHead
	lda.w PenSumLength
	asl a
	adc.w PenSumLength
	bne .1
	sta.b a1
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w #$2400
	sta.b $D5
	ldx.w #TxtNoPenalties&$FFFF
	ldy.w #$0011
	jsl.l PrintBoldCentred
	lda.w #$2000
	sta.b $D5
	bra .2
.1:									; A - 1, a1 = A, A = DrawPenaltyRow, X = $0006, ...
	dec a
	sta.b a1
	lda.w #DrawPenaltyRow
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
