QueueTeamPalette:					; queues team A's 16 colours (TeamPalettes as unpacked at $7F:D80A) for
									; CGRAM X; A kept
	sta.b tmp1
	dec.b QueueBusy
	tsc
	sta.b tmp0
	lda.b CGRAMQueueSP
	tcs
	pea.w $0020
	phx
	pea.w $007F
	lda.b tmp1
	xba
	lsr a
	lsr a
	lsr a
	adc.w #$D80A
	pha
	tsc
	sta.b CGRAMQueueSP
	lda.b tmp0
	tcs
	stz.b QueueBusy
	lda.b tmp1
	rts
