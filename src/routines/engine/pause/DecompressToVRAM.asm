DecompressToVRAM:					; Decompress A:X into a $1000 byte heap block and queue it to VRAM at Y
	phy
	tay
	lda.w #$1000
	jsl.l AllocWorkBuf
	pha
	sta.b r0
	lda.w #$007E
	sta.b r0+2
	tya
	jsl.l Decompress
	ply
	plx
	stx.b tmp0
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $1000
	pei ($9F)
	pea.w $007E
	phy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
