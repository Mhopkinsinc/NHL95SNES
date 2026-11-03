GMDecisionScreen:					; the trade decision: DrawGMDecision, then start does an accepted trade
									; (CheckTrade, ExecuteTrade) and leaves, X goes back to TradePlayers
	jsr.w DrawGMDecision
	stz.w fadestep
.loop:								; loop: TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadMenuPads
	inc.b $26
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
	beq .2
	jsr.w CheckTrade
	bcs .1
	jsr.w ExecuteTrade
.1:									; go to GameSetUp
	jmp.w GameSetUp
.2:									; if $0040 bits clear go to .3, X = a0, $05,x = $0008, go to TradePlayers
	bit.w #$0040
	beq .3
	ldx.b a0
	lda.w #$0008
	sta.b $05,x
	jmp.w TradePlayers
.3:									; go to .loop
	bra .loop
