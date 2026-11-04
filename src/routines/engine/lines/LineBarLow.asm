LineBarLow:							; selects the first energy bar tile from the scaled energy
	lda.w #$0092
	sta.b d1
	lda.b d1+2
LineBarQueue:						; the end of linebar's three fill cases: the last bar tile (the energy
									; left / $200 + d1), then the three tiles queued to VRAM at d0 + 6
	and.w #$FE00
	xba
	lsr a
	adc.b d1
	sep #$20
	sta.w $0000,y
	rep #$20
	ply
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0003
	pea.w $0000
	lda.b d0
	clc
	adc.w #$0006
	pha
	pea.w $1800
	pea.w $007E
	phy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	rts
