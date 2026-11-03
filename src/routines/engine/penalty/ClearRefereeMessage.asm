ClearRefereeMessage:				; queue blank tiles over the referee message rows
	lda.l TextMapFill
	sta.w ScratchBuf
	lda.w #$003D
	ldx.w #ScratchBuf
	ldy.w #ScratchBuf+$2
	mvn $7E,$7E
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	clc
	lda.w RefMessageWidth
	adc.w #$0002
	tay
	ldx.w #$0002
	lda.w #$5940
.loop:								; loop: push Y, push A, A + $0020, X - 1, ...
	phy
	pha
	adc.w #$0020
	pea.w $007E
	pea.w ScratchBuf
	dex
	bpl .loop
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
