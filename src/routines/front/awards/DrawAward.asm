DrawAward:							; award a0: prints its name (AwardNames) and description (AwardDescs) and
									; unpacks its picture (AwardPictures)
	lda.w #$0005
	sta.w TextSpaceWidth
	ldy.w #$5000
	jsl.l ClearVRAM
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldx.b $75
	bmi .1
	jsl.l DeleteSprite
	lda.w #$FFFF
	sta.b $75
.1:									; X = a4, A = $22,x, A and $FFFE, $22,x = A, ...
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	jsl.l RefreshSpritesLong
	lda.w #$0088
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b a0
	asl a
	pha
	asl a
	tax
	phx
	lda.l AwardNames,x
	tax
	ldy.w #$0012
	jsl.l PrintBoldCentred
	plx
	lda.l AwardNames+2,x
	beq .2
	tax
	ldy.w #$0013
	jsl.l PrintBoldCentred
.2:									; $CF = 0, $D1 = $0100, pull X, A = AwardDescs,x, ...
	stz.b $CF
	lda.w #$0100
	sta.b $D1
	plx
	lda.l AwardDescs,x
	tax
	ldy.w #$0015
	jsl.l PrintBoldCentred
	jsl.l WaitTransfers
	lda.b a0
	asl a
	asl a
	tax
	lda.b $08
	sta.b r1
	lda.w #$007E
	sta.b r1+2
	lda.l AwardPictures+2,x
	tay
	lda.l AwardPictures,x
	tyx
	jsl.l MapSetToWRAM
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	ldx.b a0
	lda.l AwardPicTileCounts,x
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	pha
	sta.b tmp0
	pea.w $0000
	pea.w $007E
	lda.b $08
	clc
	adc.w #$00EA
	pha
	adc.b tmp0
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
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	ldx.w #$50B3
	ldy.b $08
.loop:								; loop: push X, push Y, A = Y, A + $0012, ...
	pea.w $0012
	phx
	pea.w $007E
	phy
	tya
	clc
	adc.w #$0012
	tay
	txa
	clc
	adc.w #$0020
	tax
	cmp.w #$5253
	bne .loop
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$0009
	sta.w TextSpaceWidth
	rts
