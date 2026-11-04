QueueFrameTiles:					; queues the tiles of player frame A for VRAM: its ROM address from
									; FrameTileSource / FrameBankLayout, the sizes from LayoutSizes, to the
									; VRAM slots in tmp2 / tmp1
	sta.b tmp0
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.b tmp0
	asl a
	tax
	lda.l FrameTileSource,x
	sta.b r0
	lda.l FrameBankLayout,x
	sta.b r0+2
	xba
	and.w #$00FF
	asl a
	tax
	lda.l LayoutSizes,x
	sta.b tmp0
	and.w #$00FF
	bne .1
	ldx.b r0
	bra .2
.1:									; A * 2, push A, Y = A, A = tmp2, ...
	asl a
	pha
	tay
	lda.b tmp2
	and.w #$01FF
	asl a
	asl a
	asl a
	asl a
	adc.w #$6000
	pha
	adc.w #$0100
	tax
	pei ($2E)
	lda.b r0
	pha
	adc.b $07,s
	phy
	phx
	pei ($2E)
	pha
	adc.b $07,s
	tax
.2:									; A = $A0, if the result = 0 go to .3, push A, A = tmp1, ...
	lda.b $A0
	and.w #$00FF
	beq .3
	pha
	lda.b tmp1
	and.w #$01FF
	asl a
	asl a
	asl a
	asl a
	adc.w #$6000
	pha
	pei ($2E)
	phx
.3:									; A = VRAMQueueSP, VRAMQueueSP = X, QueueBusy = 0, return
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rtl
