DrawAwardWinner:					; winner A of award a0: his team's name, his photo (the team's logo sprite
									; when he has none) and his name
	pha
	jsl.l PlayerNumberTeamLong
	and.w #$00FF
	sta.w HomeTeam
	asl a
	tax
	lda.w #$0028
	sta.b $CF
	lda.w #$0070
	sta.b $D1
	lda.l TeamCityNames,x
	tax
	ldy.w #$0012
	jsl.l PrintThinCentred
	jsl.l LoadGameRostersLong
	ldy.w #$FFFE
	pla
.loop:								; loop: Y + 1, Y + 1, if A is not HomeRoster+58,y go to .loop, ...
	iny
	iny
	cmp.w HomeRoster+58,y
	bne .loop
	sty.b a0+2
	lda.w HomeRoster+222,y
	sta.b a1
	and.w #$00FF
	sta.b a3+2
	tax
	cmp.w #$00FF
	beq .1
	lda.w HomeRoster+172,y
	sta.b a3
	clc
	adc.w #$00C0
	phy
	ldy.b $68
	jsr.w UnpackPlayerPhoto
	ply
	sta.b a2
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0760
	pea.w $007E
	pei ($6B)
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0040
	pei ($71)
	lda.b a1
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	adc.b a3
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	ldx.b a4
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	jsl.l WaitTransfers
	bra .2
.1:									; X = a4, A = $22,x, A and $FFFE, $22,x = A, ...
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	lda.w #$0058
	sta.b $1A
	lda.w #$004C
	sta.b $18
	lda.w HomeTeam
	jsl.l CreateSprite
	stx.b $75
	stz.w ScratchBuf
	ldx.w #ScratchBuf
	ldy.w #ScratchBuf+$2
	lda.w #$047D
	mvn $7E,$7E
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0760
	pea.w $007E
	pea.w ScratchBuf
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
.2:									; $CF = $0010, $D1 = $0080, A = a0+2, A * 2, ...
	lda.w #$0010
	sta.b $CF
	lda.w #$0080
	sta.b $D1
	lda.b a0+2
	asl a
	asl a
	asl a
	asl a
	adc.w #$2EE1
	tax
	ldy.w #$000F
	jsl.l PrintBoldCentredStr
	jsl.l QueueHomePaletteLong
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldy.w #$2864
	ldx.w #$5245
	jsl.l MapTileBlock
	ldy.w #$3076
	ldx.w #$5106
	jsr.w MapPhotoTiles
	rts
