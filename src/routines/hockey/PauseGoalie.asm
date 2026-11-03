PauseGoalie:						; pause menu Chnge Goalie: team a2's goalies (pad up / down, left / right
									; the stat); B puts the chosen one in tmgoalie (setpersonel) and returns
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	lda.w #ChangeGoaliePage&$FFFF
	jsl.l PrintTextPage
	jsl.l GetPadTeam
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
	stz.b $7D
	ldx.w #HomeRoster
	lda.b a2
	beq .1
	ldx.w #VisRoster
.1:									; a0 = X, a1 = $0002,x, X = a2, if tmgoalie,x >= 0 go to .2, ...
	stx.b a0
	lda.w $0002,x
	sta.b a1
	ldx.b a2
	lda.w tmgoalie,x
	bpl .2
	lda.b a1
.2:									; a1+2 = A
	sta.b a1+2
.loop:								; loop: call Pausemode_gnum, call SendTextMap, fadestep = 0
	jsr.w Pausemode_gnum
	jsl.l SendTextMap
	stz.w fadestep
.loop2:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop3:								; loop: if TransfersReady is not 0 go to .loop3, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop3
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
	bne .loop2
	lda.w padchangeany
	bit.w #$1000
	bne .8
	bit.w #$0800
	beq .3
	lda.b a1+2
	beq .loop2
	dec a
	sta.b a1+2
	bra .loop
.3:									; if $0400 bits clear go to .4, if a1+2 = a1 go to .loop2, A + 1, ...
	bit.w #$0400
	beq .4
	lda.b a1+2
	cmp.b a1
	beq .loop2
	inc a
	sta.b a1+2
	bra .loop
.4:									; if $0200 bits clear go to .5, if $7D = 0 go to .loop2, A - 1, ...
	bit.w #$0200
	beq .5
	lda.b $7D
	beq .loop2
	dec a
	sta.b $7D
	bra .loop
.5:									; if $0100 bits clear go to .6, if $7D >= $000B go to .loop2, A + 1, ...
	bit.w #$0100
	beq .6
	lda.b $7D
	cmp.w #$000B
	bcs .loop2
	inc a
	sta.b $7D
	bra .loop
.6:									; if $8000 bits clear go to .loop2, if a1+2 is not a1 go to .7, A = $FFFF
	bit.w #$8000
	beq .loop2
	lda.b a1+2
	cmp.b a1
	bne .7
	lda.w #$FFFF
.7:									; X = a2, tmgoalie,x = A, call setpersonel
	ldx.b a2
	sta.w tmgoalie,x
	jsl.l setpersonel
.8:									; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu
