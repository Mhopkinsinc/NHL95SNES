PlayerStatsScreen:					; pause menu Player Stats: the skaters of team a2 sorted by a stat column
									; (left / right) or its goalies (B); Y switches the team, up / down
									; scroll, start returns
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	lda.w #PlayerStatsPage&$FFFF
	jsl.l PrintTextPage
	jsl.l seta2
	stz.b $7D
	ldy.w #$2801
	ldx.w #$5135
	jsl.l MapTileBlock
	stz.w padchangeany
.1:									; $18 = $00D0, $1A = $0028, $CF = $00A8, $D1 = $00F0, ...
	lda.w #$00D0
	sta.b $18
	lda.w #$0028
	sta.b $1A
	lda.w #$00A8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w padchangeany
	bit.w #$8000
	bne .2
	clc
	lda.b $D3
	adc.w #$026A
	pha
	ldy.w #$0012
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$0040
	ldy.w #$0012
	jsl.l ClearRAM7E
	jsl.l SendTextMap
.2:									; call TeamLogoSprite, X = HomeRoster, if a2 = 0 go to .3, X = VisRoster
	jsr.w TeamLogoSprite
	ldx.w #HomeRoster
	lda.b a2
	beq .3
	ldx.w #VisRoster
.3:									; if $7D is not $FFFF go to .4, a1 = $0002,x, call SortGoalieStats, ...
	lda.b $7D
	cmp.w #$FFFF
	bne .4
	lda.w $0002,x
	sta.b a1
	jsr.w SortGoalieStats
	bra .5
.4:									; A = $0000,x, A - $0002,x, a1 = A, call SortPlayerStats
	lda.w $0000,x
	sec
	sbc.w $0002,x
	sta.b a1
	jsr.w SortPlayerStats
.5:									; A = DrawPlayerStatRow, X = $000B, Y = $000D, call StartScrollList, ...
	lda.w #DrawPlayerStatRow
	ldx.w #$000B
	ldy.w #$000D
	jsr.w StartScrollList
	jsr.w PrintPlayerStatHeads
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
	beq .6
	jmp.w ExitToPauseMenu
.6:									; if $0800 bits clear go to .7, call ScrollListUp, go to .loop
	bit.w #$0800
	beq .7
	jsr.w ScrollListUp
	bra .loop
.7:									; if $0400 bits clear go to .8, call ScrollListDown, go to .loop
	bit.w #$0400
	beq .8
	jsr.w ScrollListDown
	bra .loop
.8:									; if $7D = $FFFF go to .11, if $0200 bits clear go to .9, ...
	ldx.b $7D
	cpx.w #$FFFF
	beq .11
	bit.w #$0200
	beq .9
	lda.b $7D
	beq .9
	dec a
	dec a
	sta.b $7D
	bra .10
.9:									; if $0100 bits clear go to .11, if $7D = $0008 go to .11, A + 1, ...
	bit.w #$0100
	beq .11
	lda.b $7D
	cmp.w #$0008
	beq .11
	inc a
	inc a
	sta.b $7D
.10:								; call ClearPlayerStatsList, call SortPlayerStats, ...
	jsr.w ClearPlayerStatsList
	jsr.w SortPlayerStats
	jsr.w RedrawScrollList
	jsr.w PrintPlayerStatHeads
	jsl.l SendTextMap
.11:								; if $4000 bits clear go to .13, A = a2, A xor $0002, a2 = A
	bit.w #$4000
	beq .13
	lda.b a2
	eor.w #$0002
	sta.b a2
.12:								; X = $7B, call DeleteSprite, X = $77, call DeleteSprite, ...
	ldx.b $7B
	jsl.l DeleteSprite
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jsr.w ClearPlayerStatsList
	jmp.w .1
.13:								; if $8000 bits clear go to .15, A = $D3, A + $02C0, Y = $0040, ...
	bit.w #$8000
	beq .15
	lda.b $D3
	clc
	adc.w #$02C0
	ldy.w #$0040
	jsl.l ClearRAM7E
	jsr.w ClearPlayerStatsList
	lda.w #$FFFF
	cmp.b $7D
	beq .14
	sta.b $7D
	bra .12
.14:								; $7D = 0, go to .12
	stz.b $7D
	bra .12
.15:								; go to .loop
	jmp.w .loop
