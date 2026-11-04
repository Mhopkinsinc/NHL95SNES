WaitDMAQueue:						; wait until the DMA queue is empty (DMAQueueHead = DMAQueueTail)
	pha
.loop:								; until the queue is empty
	lda.b DMAQueueHead
	cmp.b DMAQueueTail
	bne .loop
	pla
	rtl
.t1:								; wait up to X+Y*65536 frames for a button on pad 1
	iny
.1:									; next frame
	jsl.l WaitFrame
	dex
	bne .t1x
	dey
	bne .t1x
	lda.w #$0000
	rtl
.t1x:								; a button held: return it
	lda.b PadRaw1
	beq .1
	rtl
.t2:								; the same for pad 2
	iny
.2:									; next frame
	jsl.l WaitFrame
	dex
	bne .t1xx
	dey
	bne .t1xx
	lda.w #$0000
	rtl
.t1xx:								; a button held: return it
	lda.b PadRaw2
	beq .2
	rtl
.t2x:								; wait for one of the buttons in A on pad 1
	sta.b r3
	iny
.3:									; next frame
	jsl.l WaitFrame
	dex
	bne .t1xxx
	dey
	bne .t1xxx
	lda.w #$0000
	rtl
.t1xxx:								; one of them held: return them
	lda.b PadRaw1
	and.b r3
	beq .3
	rtl
.t2xx:								; the same for pad 2
	sta.b r3
	iny
.4:									; next frame
	jsl.l WaitFrame
	dex
	bne .t1xxxx
	dey
	bne .t1xxxx
	lda.w #$0000
	rtl
.t1xxxx:							; one of them held: return them
	lda.b PadRaw2
	and.b r3
	beq .4
	rtl
