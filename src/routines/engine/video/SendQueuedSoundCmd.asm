SendQueuedSoundCmd:					; loads the queue tail and sends one command if the CPU sound queue is not
									; empty
	ldx.w SoundQueueTail
SendSoundCmdAtTail:					; sends the queued command at X unless X equals the queue head; advances
									; the tail
	cpx.w SoundQueueHead
	bne .1
	rtl
.1:									; A = X, A + $0004, A and $00FF, SoundQueueTail = A, ...
	txa
	clc
	adc.w #$0004
	and.w #$00FF
	sta.w SoundQueueTail
	lda.l $7E0000+SoundCmdQueue+2,x
	tay
	lda.l $7E0000+SoundCmdQueue+1,x
	pha
	lda.l $7E0000+SoundCmdQueue,x
	plx
	pha
	tya
	sta.w APUIO1
	sep #$20
	txa
	sta.w APUIO0
	pla
	sta.w APUIO3
	pla
	rep #$20
	rtl
