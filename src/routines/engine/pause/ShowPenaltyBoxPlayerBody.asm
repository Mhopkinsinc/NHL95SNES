ShowPenaltyBoxPlayerBody:			; draws the penalty box player after the row limit check
	pha
	txa
	asl a
	asl a
	asl a
	asl a
	pha
	lda.w #HomeRoster
	cpx.w #$0034
	bcc .1
	lda.w #$2EC7
.1:									; A + $01,s, Y = A, pull A, A = $0110,y, ...
	clc
	adc.b $01,s
	tay
	pla
	lda.w $0110,y
	and.w #$00FF
	tax
	lda.l BCDTable,x
	pha
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDText
	pla
	and.w #$000F
	jsr.w BCDTextAt
	lda.w #$0020
	sta.w mesarea,x
	inx
	pla
	and.w #$07FF
	phx
	jsr.w TimeTextMMSS
	plx
	sep #$20
.loop:								; loop: A = mesarea,x, X + 1, if mesarea,x is not $3F go to .loop, ...
	lda.w mesarea,x
	inx
	cmp.b #$3F
	bne .loop
	lda.b #$3A
	sta.w mesarea-1,x
	rep #$20
	lda.w #$0020
	jsl.l AllocWorkBuf
	pha
	tay
	ldx.w #$0000
.loop2:								; loop: A = mesarea,x, if the result = 0 go to .2, A + $0080, ...
	lda.w mesarea,x
	and.w #$00FF
	beq .2
	clc
	adc.w #$0080
	ora.w #$3A00
	sta.w $0000,y
	inx
	iny
	iny
	bra .loop2
.2:									; A = Y, A - $01,s, X = A, pull Y, ...
	tya
	sec
	sbc.b $01,s
	tax
	ply
	dec.b QueueBusy
	tsc
	sta.b r3
	lda.b VRAMQueueSP
	tcs
	phx
	lda.w #$5800
	clc
	adc.b tmp1
	adc.b tmp2
	pha
	pea.w $007E
	phy
	tsc
	sta.b VRAMQueueSP
	lda.b r3
	tcs
	stz.b QueueBusy
	lda.b tmp2
	clc
	adc.w #$0020
	sta.b tmp2
	ply
	rts
