StatsReport:						; pause menu Game Stats: the team stat rows as a scrolling list
									; (DrawGameStatRow draws each, from one of two row lists); start returns
	lda.w #$531F
	jsr.w SetupStatsPage
	ldx.w #$5D5F
	lda.w OptPen
	bne .1
	ldx.w #$5DD7
.1:									; A = $C30000,x, A and $00FF, a1 = A, X + 1, ...
	lda.l $C30000,x
	and.w #$00FF
	sta.b a1
	inx
	stx.b a0
	ldx.w #$0009
	ldy.w #$000F
	lda.w #DrawGameStatRow
	jsr.w StartScrollList
	jsl.l SendTextMap
	stz.w fadestep
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
	jsl.l ReadMenuPads
	inc.b $26
	jsr.w ScrollListArrows
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
	bne .4
	bit.w #$0800
	beq .2
	jsr.w ScrollListUp
	bra .loop
.2:									; if $0400 bits clear go to .3, call ScrollListDown, go to .loop
	bit.w #$0400
	beq .3
	jsr.w ScrollListDown
	bra .loop
.3:									; go to .loop
	bra .loop
.4:									; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu
