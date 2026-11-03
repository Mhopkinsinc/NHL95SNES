QueueColours16:						; QueueColours with d3 = 16
	pha
	lda.w #$0010
	sta.b d3
	pla
QueueColours:						; queues d3 colours from X:A for CGRAM at Y (a record on the CGRAM
									; transfer stack)
	sta.b $77
	stx.b $79
	dec.b QueueBusy
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	lda.b d3
	asl a
	pha
	phy
	pei ($79)
	pei ($77)
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	rtl
