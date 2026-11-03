updatepwrplay_clr:					; from updatepwrplay and other segments
	lda.w #$2000
	trb.w sflags
	beq updatepwrplay_clrReturn
RedrawPeriodBox:					; blanks three 11 tile text map rows from $5AA0 and redraws the period box
									; (DrawPeriodBox)
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.l TextMapFill
	sta.w ListBuf
	ldx.w #ListBuf
	ldy.w #ListBuf+$2
	lda.w #$0013
	mvn $7E,$7E
	clc
	lda.w #$5AA0
	ldy.w #$0002
.loop:								; loop: push A, A + $0020, Y - 1, if the result >= 0 go to .loop, ...
	pea.w $0016
	pha
	pea.w $007E
	pea.w ListBuf
	adc.w #$0020
	dey
	bpl .loop
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jml.l DrawPeriodBox
