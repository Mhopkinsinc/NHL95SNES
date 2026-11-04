QueueVRAMDMALen:					; queue a DMA to VRAM at Y of the bytes at X:A after their length byte
	sta.w r0
	stx.w r0+2
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	lda.b [r0]
	and.w #$00FF
	pha
	pea.w $0000
	phy
	pea.w $1800
	pei ($2E)
	lda.b r0
	inc a
	pha
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	rtl
