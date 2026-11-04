TransferQueueStubUnused:			; r0 = A, $2E = X, then the transfer queue opened and closed once with no
									; record; nothing calls it
	sta.b r0
	stx.b r0+2
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
