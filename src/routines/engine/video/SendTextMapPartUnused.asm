SendTextMapPartUnused:				; queues Y rows of the text map from row A, columns TextColLow to
									; TextColHigh, to the VRAM map at $5C00 from row X; nothing calls it
	sty.b tmp3
	tay
	lda.w TextColLow
	lsr a
	lsr a
	lsr a
	sta.b $16
	lda.w TextColHigh
	clc
	adc.w #$0007
	lsr a
	lsr a
	lsr a
	sec
	sbc.b $16
	asl a
	sta.b $14
	tya
	xba
	lsr a
	lsr a
	adc.b $16
	adc.b $16
	adc.b $D3
	tay
	txa
	xba
	lsr a
	lsr a
	lsr a
	adc.b $16
	adc.w #$5C00
	tax
	dec.b QueueBusy
	tsc
	sta.b $1C
	lda.b VRAMQueueSP
	tcs
.loop:								; loop: push X, push Y, A = X, A + $0020, ...
	pei ($14)
	phx
	pea.w $007E
	phy
	txa
	adc.w #$0020
	tax
	tya
	adc.w #$0040
	tay
	dec.b tmp3
	bne .loop
	tsc
	sta.b VRAMQueueSP
	lda.b $1C
	tcs
	stz.b QueueBusy
	rtl
