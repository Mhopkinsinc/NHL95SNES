StanleyCupScreen:					; the Stanley Cup screen: the cup, CONGRATULATIONS, team A wins the
									; stanley cup, defeating team X in the final game of the playoffs, team
									; A's logo sprite; returns on start
	sta.b a0
	stx.b a0+2
	jsr.w InitAwardScreen
	lda.w #$000F
	sta.b $18
	lda.w #$0057
	sta.b $1A
	lda.w #$0027
	jsl.l CreateSprite
	lda.w #$0070
	sta.b $1A
	lda.w #$00E0
	sta.b $18
	lda.b a0
	jsl.l CreateSprite
	inc.b $38,x
	lda.b $08
	sta.b r1
	lda.w #$007E
	sta.b r1+2
	ldx.w #StanleyCupMap>>16
	lda.w #StanleyCupMap&$FFFF
	jsl.l MapSetToWRAM
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	ldx.w #$506D
	ldy.b $08
.loop:								; loop: push X, push Y, A = Y, A + $0010, ...
	pea.w $0010
	phx
	pea.w $007E
	phy
	tya
	clc
	adc.w #$0010
	tay
	txa
	clc
	adc.w #$0020
	tax
	cmp.w #$522D
	bne .loop
	pea.w $0AE0
	pea.w $0000
	pea.w $007E
	lda.b $08
	clc
	adc.w #$00E0
	pha
	adc.w #$0AE0
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0030
	pea.w $007E
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w #$2400
	sta.b $D5
	ldx.w #TxtCongratulations&$FFFF
	ldy.w #$0012
	jsl.l PrintItalicCentred
	lda.w #$2000
	sta.b $D5
	lda.b a0
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	phx
	ldx.w #TxtWinsTheStanleyCup&$FFFF
	jsl.l UnpackText
	txy
	plx
	jsl.l ConcatStringsLong
	ldy.w #$0015
	jsl.l PrintBoldCentredStr
	ldx.w #TxtDefeating&$FFFF
	jsl.l UnpackText
	phx
	lda.b a0+2
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	txy
	plx
	jsl.l ConcatStringsLong
	phx
	ldx.w #TxtInTheFinal&$FFFF
	jsl.l UnpackText
	txy
	plx
	jsl.l ConcatStringsLong
	ldy.w #$0016
	jsl.l PrintBoldCentredStr
	ldx.w #TxtGameOfThePlayoffs&$FFFF
	ldy.w #$0017
	jsl.l PrintBoldCentred
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.w BG2HScroll
	stz.w fadein
.loop2:								; loop: TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
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
	bne .loop2
	lda.w padchangeany
	bit.w #$1000
	beq .loop2
	rtl
