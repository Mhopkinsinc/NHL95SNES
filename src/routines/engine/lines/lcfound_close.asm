lcfound_close:						; closes team a2's line change box: its six rows overwritten from
									; TextMapFill through the transfer queue, then the score box (when the
									; box was over it) and the clock redrawn
	jsr.w setlccords
	pha
	tay
	jsl.l WaitTransfers
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	ldx.w #$0006
.loop:								; loop: push Y, A = Y, A + $0020, Y = A, ...
	pea.w $000B
	pea.w $0000
	phy
	pea.w $1808
	pea.w TextMapFill>>16
	pea.w TextMapFill&$FFFF
	tya
	clc
	adc.w #$0020
	tay
	dex
	bne .loop
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	pla
	cmp.w #$5AB5
	bcc .1
	jsl.l DrawScoreBox
.1:									; call showclockdma, call WaitTransfers, go to printscores1
	jsl.l showclockdma
	jsl.l WaitTransfers
	jml.l printscores1
