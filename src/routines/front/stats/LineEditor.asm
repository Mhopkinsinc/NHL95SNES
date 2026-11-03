LineEditor:							; pause menu Edit Lines: the lines of team a2 (pad left / right changes
									; the line); start returns
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	jsl.l seta2
	ldy.w #$2801
	ldx.w #$5135
	jsl.l MapTileBlock
	lda.w #$00D0
	sta.b $18
	lda.w #$0028
	sta.b $1A
	lda.w #$00A8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	jsr.w TeamLogoSprite
	stz.b a1+2
	stz.b $79
	ldx.w #$0000
	lda.w OptLine
	beq .1
	ldx.w #$0006
.1:									; $7B = X
	stx.b $7B
.2:									; if $7B = $0000 go to .3, $CF = $0010, Y = $0018, ...
	ldx.b $7B
	cpx.w #$0000
	beq .3
	lda.w #$0010
	sta.b $CF
	ldy.w #$0018
	ldx.w #TxtPadLRChangeLine&$FFFF
	jsl.l PrintBoldLeft
.3:									; A = EditLinesPage&$FFFF, call PrintTextPage, X = HomeRoster, ...
	lda.w #EditLinesPage&$FFFF
	jsl.l PrintTextPage
	ldx.w #HomeRoster
	ldy.w #$17DB
	lda.b a2
	beq .4
	ldx.w #VisRoster
	ldy.w #$1813
.4:									; a0 = X, a0+2 = Y
	stx.b a0
	sty.b a0+2
.5:									; call PrintLineNames
	jsr.w PrintLineNames
.6:									; call SendTextMap, fadestep = 0
	jsl.l SendTextMap
	stz.w fadestep
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
	bit.w #$1000
	beq .7
	jmp.w .15
.7:									; if $0800 bits clear go to .8, if a1+2 = 0 go to .loop, A - 1, go to .9
	bit.w #$0800
	beq .8
	lda.b a1+2
	beq .loop
	dec a
	bra .9
.8:									; if $0400 bits clear go to .10, if a1+2 >= a1 go to .loop, A + 1
	bit.w #$0400
	beq .10
	lda.b a1+2
	cmp.b a1
	bcs .loop
	inc a
.9:									; X = a1+2, a1+2 = A, d0 = $2000, A = X, ...
	ldx.b a1+2
	sta.b a1+2
	lda.w #$2000
	sta.b d0
	txa
	clc
	adc.w #$000D
	jsr.w RecolourTextRow
	lda.w #$2400
	sta.b d0
	lda.b a1+2
	clc
	adc.w #$000D
	jsr.w RecolourTextRow
	bra .6
.10:								; if $0200 bits clear go to .11, if $79 = 0 go to .loop, A - 1, ...
	bit.w #$0200
	beq .11
	lda.b $79
	beq .loop
	dec a
	sta.b $79
	bra .12
.11:								; if $0100 bits clear go to .13, if $79 = $7B go to .14, A + 1, $79 = A
	bit.w #$0100
	beq .13
	lda.b $79
	cmp.b $7B
	beq .14
	inc a
	sta.b $79
.12:								; X = $D3, Y = $0014
	ldx.b $D3
	ldy.w #$0014
.loop3:								; loop: $0200,x = 0, $0240,x = 0, $0280,x = 0, X + 1, ...
	stz.w $0200,x
	stz.w $0240,x
	stz.w $0280,x
	inx
	inx
	dey
	bpl .loop3
	lda.b $D3
	clc
	adc.w #$0300
	ldy.w #$02C0
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.b a1+2
	jmp.w .5
.13:								; if $8000 bits clear go to .14, call SelectLinePlayer, go to .2
	bit.w #$8000
	beq .14
	jsr.w SelectLinePlayer
	jmp.w .2
.14:								; go to .loop
	jmp.w .loop
.15:								; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu
