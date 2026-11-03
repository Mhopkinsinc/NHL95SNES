TradePlayers:						; the Trade Players screen: both rosters (Y switches the team, up / down
									; move, B marks a player); start goes on to GMDecisionScreen, X leaves
	jsl.l CheckTradesFrozen
	jsl.l FadeOutWait
	jsr.w DrawTradePage
	stz.w fadestep
.1:									; TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadMenuPads
	inc.b $26
	jsr.w PlaceTradeCursors
	ldx.b a0
	lda.b d1+2
	asl a
	asl a
	asl a
	ldy.b a2
	bne .2
	adc.w #$0046
	bra .3
.2:									; A + $008E
	adc.w #$008E
.3:									; $08,x = A, call AnimateSprites, $28 = OAMBuf+$1FF, ...
	sta.b $08,x
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w repeatdelayframes
	bne .1
	lda.w padchangeany
	bit.w #$1000
	beq .4
	jmp.w GMDecisionScreen
.4:									; if $0040 bits clear go to .5, go to GameSetUp
	bit.w #$0040
	beq .5
	jmp.w GameSetUp
.5:									; if $0800 bits clear go to .7, if d1+2 = 0 go to .6, A - 1, d1+2 = A, ...
	bit.w #$0800
	beq .7
	lda.b d1+2
	beq .6
	dec a
	sta.b d1+2
	bra .1
.6:									; call TradeCursorUp, go to .1
	jsr.w TradeCursorUp
	bra .1
.7:									; if $0400 bits clear go to .9, if d1+2 >= $0004 go to .8, X = a2, ...
	bit.w #$0400
	beq .9
	lda.b d1+2
	cmp.w #$0004
	bcs .8
	ldx.b a2
	sec
	adc.b $77,x
	cmp.b $7B,x
	beq .1
	inc.b d1+2
	bra .1
.8:									; call TradeCursorDown, go to .1
	jsr.w TradeCursorDown
	jmp.w .1
.9:									; if $4000 bits clear go to .10, A = a2, A xor $0002, a2 = A, ...
	bit.w #$4000
	beq .10
	lda.b a2
	eor.w #$0002
	sta.b a2
	jmp.w .1
.10:								; if $8000 bits clear go to .12, tmp0 = 0, if a2 = 0 go to .11, ...
	bit.w #$8000
	beq .12
	stz.b tmp0
	ldx.b a2
	beq .11
	lda.w #$0064
	sta.b tmp0
.11:								; A = d1+2, A + $77,x, A + tmp0, X = A, ...
	lda.b d1+2
	clc
	adc.b $77,x
	adc.b tmp0
	tax
	lda.w ScratchBuf,x
	eor.w #$0001
	sta.w ScratchBuf,x
	jsr.w RedrawTradeLists
	jsl.l SendTextMap
.12:								; go to .1
	jmp.w .1
