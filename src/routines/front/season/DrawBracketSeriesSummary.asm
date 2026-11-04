DrawBracketSeriesSummary:			; queues the selected series teams and win counts into the summary map
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.w BracketCursorCell
	asl a
	tax
	lda.l BracketCellSeries,x
	tax
	lda.l SRPOWins,x
	tay
	and.w #$000F
	xba
	lsr a
	lsr a
	adc.w #$02A0
	adc.b $D3
	sta.b tmp0
	tya
	and.w #$00F0
	asl a
	asl a
	adc.w #$02A0
	adc.b $D3
	sta.b tmp1
	txa
	asl a
	tax
	pea.w $0080
	pea.w $5F00
	pea.w $007E
	lda.b $D3
	adc.w #$0700
	pha
	ldy.w #$000A
	lda.w BracketSlotTeams,x
	bpl .1
	lda.b $D3
	adc.w #$03E0
	ldy.w #$0014
	bra .2
.1:									; A / 2, A / 2, A + $D3
	xba
	lsr a
	lsr a
	adc.b $D3
.2:									; push Y, push A, Y = $000A, if BracketSlotTeams+$1E,x >= 0 go to .3, ...
	pea.w $0006
	pea.w $5F09
	pea.w $007E
	pei ($9F)
	phy
	pea.w $5F04
	pea.w $007E
	pha
	ldy.w #$000A
	lda.w BracketSlotTeams+$1E,x
	bpl .3
	lda.b $D3
	adc.w #$03E0
	ldy.w #$0014
	bra .4
.3:									; A / 2, A / 2, A + $D3
	xba
	lsr a
	lsr a
	adc.b $D3
.4:									; push Y, push A, A = VRAMQueueSP, VRAMQueueSP = X, ...
	pea.w $0006
	pea.w $5F29
	pea.w $007E
	pei ($A1)
	phy
	pea.w $5F24
	pea.w $007E
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	rts
