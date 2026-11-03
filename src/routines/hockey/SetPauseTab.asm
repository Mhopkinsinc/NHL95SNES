SetPauseTab:						; switches the pause menu to tab X when it is another: the old one erased
									; (DeselectPauseTab), item 0, DrawPauseTab
	cpx.w pausetab
	beq PauseMenuReturn
	phx
	bit.w pausetab
	bmi .1
	jsr.w DeselectPauseTab
.1:									; pull A, pausetab = A, pauseitem = 0
	pla
	sta.w pausetab
	stz.w pauseitem
DrawPauseTab:						; draws tab A's item list (its text in bank $C3 from PauseTabLists, or
									; PracticePauseTabLists in play mode 1), the current item's row
									; highlighted (palette $3200), queued to VRAM
	asl a
	tax
	lda.w OptPlayMode
	cmp.w #$0001
	bne .1
	lda.l PracticePauseTabLists,x
	bra .2
.1:									; A = PauseTabLists,x
	lda.l PauseTabLists,x
.2:									; call DrawPauseItems, call SelectPauseTab, A = pauseitem, A / 2, ...
	jsr.w DrawPauseItems
	jsr.w SelectPauseTab
	lda.w pauseitem
	xba
	lsr a
	adc.w PauseMapBuf
	tax
	ldy.w #$000B
.loop:								; loop: A = $7E0314,x, A and $E3FF, A or $3200, $7E0314,x = A, ...
	lda.l $7E0314,x
	and.w #$E3FF
	ora.w #$3200
	sta.l $7E0314,x
	inx
	inx
	dey
	bpl .loop
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0700
	pea.w $5800
	pea.w $007E
	lda.w PauseMapBuf
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jmp.w ShowPenaltyBoxes
