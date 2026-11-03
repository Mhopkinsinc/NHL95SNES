SetLineSlot:						; puts player $7B (+ 1) in slot A of line X of the line block at $65
									; through the slot's handler (LineSlotHandlers), the old player moved when
									; the new one was in the line
	stx.b tmp1
	inc.b $7B
	asl a
	tax
	lda.l LineSlotHandlers,x
	sta.b tmp0
	lda.b tmp1
	asl a
	asl a
	asl a
	adc.b a0+2
	tax
	sep #$20
	jmp ($009F)
