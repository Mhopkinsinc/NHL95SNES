QueueTextTiles:						; queues the tiles DrawText made for VRAM (text row Y)
	lda.w #$3000
	sta.b p0
	lda.b $12
	lsr a
	lsr a
	lsr a
	sta.b $16
	tya
	xba
	lsr a
	lsr a
	lsr a
	adc.b $16
	sta.b $14
	inc a
	asl a
	asl a
	asl a
	adc.b p0
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.b $12
	and.w #$FFF8
	pha
	asl a
	phy
	pea.w $007E
	adc.b tmp3
	pha
	lda.b $0A
	adc.w #$0007
	sec
	sbc.b $07,s
	and.w #$FFF8
	sta.b tmp3
	asl a
	sta.b $07,s
	tax
	lda.b $0E
	lsr a
	bcc .1
	phx
	lda.b $07,s
	adc.w #$00FF
	pha
	pea.w $007E
	lda.b $07,s
	adc.w #$0200
	pha
.1:									; A = VRAMQueueSP, VRAMQueueSP = X, QueueBusy = 0, TransfersReady + 1, ...
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	inc.w TransfersReady
	rtl
