SeasonAwards:						; the end of season awards: the awards music, then award a0 (from 0) with
									; DrawAward, FindAwardWinner and its winner; pad left / right steps
									; through the 8 awards, start returns
	jsl.l SoundVolumeDown
	lda.w #(SongLists+$7)&$FFFF
	ldx.w #(SongLists+$7)>>16
	ldy.w #$FF00
	jsl.l LoadSounds
	lda.w #$00A7
	jsl.l StartSound
	jsl.l SoundVolumeUp
	jsr.w InitAwardScreen
	lda.w #$003D
	sta.b $1A
	lda.w #$0030
	sta.b $18
	lda.w #$0026
	jsl.l CreateSprite
	stx.b a4
	lda.w #$2000
	sta.b $36,x
	lda.w #$FFFF
	sta.b $75
	lda.w #$0240
	jsl.l AllocWorkBuf
	sta.b r0
	sta.b r2
	lda.w #$007E
	sta.b r0+2
	ldx.w #GradientBarTiles>>16
	lda.w #GradientBarTiles&$FFFF
	jsl.l Decompress
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0240
	pea.w $0640
	pea.w $007E
	pei ($34)
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	ldy.w #$2864
	ldx.w #$5245
	jsl.l MapTileBlock
	ldy.w #$3076
	ldx.w #$5106
	jsr.w MapPhotoTiles
	lda.w #$0240
	jsl.l FreeWorkBuf
	lda.w #$0002
	sta.w BG2VScroll
	lda.w #SeasonAwardsPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	jsl.l SendTextMap
	stz.w fadestep
	stz.b a0
	jsl.l WaitTransfers
	jsr.w DrawAward
	jsr.w FindAwardWinner
	jsr.w DrawAwardWinner
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
	bit.w #$0100
	beq .1
	lda.b a0
	inc a
	cmp.w #$0008
	bcc .2
	lda.w #$0000
	bra .2
.1:									; if $0200 bits clear go to .4, A = a0, A - 1, ...
	bit.w #$0200
	beq .4
	lda.b a0
	dec a
	bpl .2
	lda.w #$0007
.2:									; a0 = A, A = $D3, A + $0140, Y = $0480, ...
	sta.b a0
	lda.b $D3
	clc
	adc.w #$0140
	ldy.w #$0480
	jsl.l ClearRAM7E
	jsr.w DrawAward
	jsr.w FindAwardWinner
	ldx.b a0
	cpx.w #$0007
	bne .3
	jsr.w DrawPresidentsWinner
	bra .loop
.3:									; call DrawAwardWinner, go to .loop
	jsr.w DrawAwardWinner
	bra .loop
.4:									; if $1000 bits clear go to .loop, return
	bit.w #$1000
	beq .loop
	rtl
