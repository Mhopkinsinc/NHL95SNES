QueueBracketColumn:					; gathers and queues one bracket map column for the scrolling background
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0038
	pea.w $0081
	lda.b a0
	clc
	adc.b tmp0
	bit.w #$0020
	beq .1
	and.w #$001F
	ora.w #$5400
	bra .2
.1:									; A and $001F, A or $5000
	and.w #$001F
	ora.w #$5000
.2:									; push A, A = $0038, call AllocWorkBuf, push A, ...
	pha
	pea.w $1801
	pea.w $007E
	lda.w #$0038
	jsl.l AllocWorkBuf
	pha
	tay
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	clc
	lda.b a0
	adc.b tmp0
	asl a
	tax
	lda.w #$001B
	sta.b tmp0
.loop:								; loop: $0000,y = rinkmapbuf,x, Y + 1, Y + 1, A = X, ...
	lda.l rinkmapbuf,x
	sta.w $0000,y
	iny
	iny
	txa
	adc.w #$00C8
	tax
	dec.b tmp0
	bpl .loop
	rts
