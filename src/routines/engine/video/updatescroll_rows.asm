updatescroll_rows:					; queues the rink map rows that the vertical scroll brought on screen;
									; BG2VScroll from Vscroll + $170
	lda.w Vscroll
	clc
	adc.w #$0170
	sta.w BG2VScroll
	lsr a
	lsr a
	lsr a
	tax
	sec
	sbc.w Oldrow
	bne .1
	jmp.w .6
.1:									; if plus go to .3, A xor $FFFF, A + 1, if A >= $0019 go to .2, ...
	bpl .3
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs .2
	and.w #$001F
	sta.b tmp1
	stx.w Oldrow
	lda.w vramrow
	sec
	sbc.b tmp1
	and.w #$001F
	sta.w vramrow
	sta.b tmp2
	stx.b tmp0
	bra .4
.2:									; tmp1 = $001D, A = X, A and $001F, vramrow = A, ...
	lda.w #$001D
	sta.b tmp1
	txa
	and.w #$001F
	sta.w vramrow
	sta.b tmp2
	stx.b tmp0
	stx.w Oldrow
	bra .4
.3:									; Oldrow = X, if A >= $0019 go to .2, tmp1 = A, A + vramrow, ...
	stx.w Oldrow
	cmp.w #$0019
	bcs .2
	sta.b tmp1
	adc.w vramrow
	and.w #$001F
	sta.w vramrow
	adc.w #$001D
	sec
	sbc.b tmp1
	and.w #$001F
	sta.b tmp2
	txa
	clc
	adc.w #$001D
	sec
	sbc.b tmp1
	sta.b tmp0
.4:									; QueueBusy - 1, A = VRAMQueueSP, VRAMQueueSP = X, A = $0020, ...
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.w #$0020
	sec
	sbc.b tmp2
	tax
	sbc.b tmp1
	bpl .5
	eor.w #$FFFF
	inc a
	sta.b tmp1
	txa
	xba
	lsr a
	lsr a
	pha
	stx.b tmp3
	tax
	lda.b tmp2
	xba
	lsr a
	lsr a
	lsr a
	adc.w #$5000
	pha
	pea.w $007F
	adc.w #$0400
	tay
	lda.b tmp0
	xba
	lsr a
	lsr a
	adc.w #rinkmapbuf&$FFFF
	pha
	phx
	phy
	pea.w $007F
	adc.w #$1540
	pha
	stz.b tmp2
	lda.b tmp0
	adc.b tmp3
	sta.b tmp0
.5:									; A = tmp1, A / 2, A / 2, push A, ...
	lda.b tmp1
	xba
	lsr a
	lsr a
	pha
	tax
	lda.b tmp2
	xba
	lsr a
	lsr a
	lsr a
	adc.w #$5000
	pha
	pea.w $007F
	adc.w #$0400
	tay
	lda.b tmp0
	xba
	lsr a
	lsr a
	adc.w #rinkmapbuf&$FFFF
	pha
	phx
	phy
	pea.w $007F
	adc.w #$1540
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
.6:									; A = Hscroll, A + $00C0, BG2HScroll = A, return
	lda.w Hscroll
	clc
	adc.w #$00C0
	sta.w BG2HScroll
	rtl
