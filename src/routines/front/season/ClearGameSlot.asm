ClearGameSlot:						; clears the text rows of game slot $81 - 1 (- 2 with carry clear on
									; entry, wrapping in 0-2), Y = its first row
	lda.b d0+2
	sbc.w #$0001
	bcs .1
	adc.w #$0003
.1:									; A * 2, X = A, push X, A = GameSlotOffsets,x, ...
	asl a
	tax
	phx
	lda.l GameSlotOffsets,x
	adc.b $D3
	ldy.w #$01C0
	jsl.l ClearRAM7E
	plx
	lda.l GameSlotRows,x
	tay
	rts
