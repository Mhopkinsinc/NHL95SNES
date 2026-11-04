QueueFaceoffBox:					; queues face off box frame A to VRAM: $280 bytes from FaceoffBoxBuf (+
									; FaceoffBoxFrameOffsets by frame) to FaceoffBoxVRAM
	asl a
	tax
	lda.l $7E2024
	adc.l FaceoffBoxFrameOffsets,x
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0280
	lda.w FaceoffBoxVRAM
	pha
	pea.w $007E
	phy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
