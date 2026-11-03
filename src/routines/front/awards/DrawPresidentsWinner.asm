DrawPresidentsWinner:				; winner A of the Presidents Trophy: the team's name and its logo sprite
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
	jsl.l QueueHomePaletteLong
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldy.w #$2864
	ldx.w #$5245
	jsl.l MapTileBlock
	rts
