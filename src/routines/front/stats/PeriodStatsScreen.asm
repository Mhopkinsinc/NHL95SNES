PeriodStatsScreen:					; pause menu Period Stats: DrawPeriodStats; B switches between goals and
									; shots, start returns
	lda.w #$532D
	jsr.w SetupStatsPage
	stz.b $7B
	jsr.w DrawPeriodStats
	jsl.l SendTextMap
	stz.w fadein
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
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
	bit.w #$8000
	beq .1
	lda.b $D3
	clc
	adc.w #$03C0
	ldy.w #$0340
	jsl.l ClearRAM7E
	lda.b $7B
	eor.w #$0001
	sta.b $7B
	jsr.w DrawPeriodStats
	jsl.l SendTextMap
	bra .loop
.1:									; if $1000 bits clear go to .loop, go to ExitToPauseMenu
	bit.w #$1000
	beq .loop
	jmp.w ExitToPauseMenu
