SendTextMap:						; queues the text map ($800 bytes) for VRAM at $5C00
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0800
	pea.w $5C00
	pea.w $007E
	pei ($D3)
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
