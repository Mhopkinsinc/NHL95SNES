QueueVisPalette:					; queues VisTeam's 16 colours (TeamPalettes as unpacked at $7F:D80A) for
									; CGRAM $30
	dec.b QueueBusy
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	pea.w $0020
	pea.w $0030
	pea.w $007F
	lda.w VisTeam
	xba
	lsr a
	lsr a
	lsr a
	adc.w #$D80A
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	rts
