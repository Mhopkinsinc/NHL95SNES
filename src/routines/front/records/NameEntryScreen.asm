NameEntryScreen:					; the Name Entry screen of a pad: the 8 user names (up / down), B edits
									; one (EditUserName), start takes it
	jsl.l FadeOutWait
	jsr.w DrawNameLog
	stz.w fadestep
.loop:								; loop: TransfersReady + 1, call ReadPauseMenuPad, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadPauseMenuPad
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
	jsr.w EditUserName
	bra .loop
.1:									; if $0400 bits clear go to .2, A = a0+2, A + 1, ...
	bit.w #$0400
	beq .2
	lda.b a0+2
	inc a
	cmp.w #$0008
	bcc .3
	lda.w #$0000
	bra .3
.2:									; if $0800 bits clear go to .4, A = a0+2, A - 1, ...
	bit.w #$0800
	beq .4
	lda.b a0+2
	dec a
	bpl .3
	lda.w #$0007
.3:									; a0+2 = A, A * 2, A * 2, A * 2, ...
	sta.b a0+2
	asl a
	asl a
	asl a
	adc.w #$0036
	ldx.b a0
	sta.b $08,x
	bra .loop
.4:									; if $1000 bits clear go to .loop, return
	bit.w #$1000
	beq .loop
	rts
