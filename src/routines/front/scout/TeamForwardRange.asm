TeamForwardRange:					; team record A: tmp3 = the PlayerList index of its first forward (after
									; the goalies), $0A = the index after its forwards (high nibble); no
									; caller found
	pha
	tax
	jsr.w RecordGoalieCount
	sta.b tmp3
	pla
	tax
	lda.l $C30000,x
	and.w #$07FF
	lsr a
	sec
	sbc.w #$001C
	clc
	adc.b tmp3
	sta.b tmp3
	txa
	clc
	adc.l $C30006,x
	tax
	lda.l $C30003,x
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.b tmp3
	sta.b $0A
	rts
