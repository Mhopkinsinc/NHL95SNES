TeamRoster:							; pause menu Team Roster: the roster of team a2 (ShowRosterLine prints its
									; page: Goalies, Line, Stat); the pad pages through it, start returns
	lda.w #$0001
	sta.w RatingMode
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	lda.w #TeamRosterPage&$FFFF
	jsl.l PrintTextPage
	jsl.l GetPadTeam
	stz.b $7D
	stz.b $79
	ldy.w #$2801
	ldx.w #$5135
	jsl.l MapTileBlock
.1:									; call ShowRosterLine, $18 = $00D0, $1A = $0028, $CF = $00A8, ...
	jsr.w ShowRosterLine
	lda.w #$00D0
	sta.b $18
	lda.w #$0028
	sta.b $1A
	lda.w #$00A8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	jsr.w TeamLogoSprite
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
	bne .10
	bit.w #$0100
	beq .4
	lda.b $7D
	ldx.b $79
	bne .2
	cmp.w #$000B
	bcs .loop
	bra .3
.2:									; if A >= $000F go to .loop
	cmp.w #$000F
	bcs .loop
.3:									; $7D + 1, go to .9
	inc.b $7D
	bra .9
.4:									; if $0200 bits clear go to .5, if $7D = 0 go to .loop, $7D - 1, go to .9
	bit.w #$0200
	beq .5
	lda.b $7D
	beq .loop
	dec.b $7D
	bra .9
.5:									; if $0400 bits clear go to .6, if $79 >= $0007 go to .loop, $79 + 1, ...
	bit.w #$0400
	beq .6
	lda.b $79
	cmp.w #$0007
	bcs .loop
	inc.b $79
	bra .9
.6:									; if $0800 bits clear go to .7, if $79 = 0 go to .loop, $79 - 1, ...
	bit.w #$0800
	beq .7
	lda.b $79
	beq .loop
	dec.b $79
	bne .9
	lda.w #$000B
	cmp.b $7D
	bcs .9
	sta.b $7D
	bra .9
.7:									; if $4000 bits clear go to .8, A = $0240, A + $D3, Y = $0080, ...
	bit.w #$4000
	beq .8
	lda.w #$0240
	clc
	adc.b $D3
	ldy.w #$0080
	jsl.l ClearRAM7E
	lda.b a2
	eor.w #$0002
	sta.b a2
	bra .9
.8:									; go to .loop
	jmp.w .loop
.9:									; X = $7B, call DeleteSprite, go to .1
	ldx.b $7B
	jsl.l DeleteSprite
	jmp.w .1
.10:								; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu
