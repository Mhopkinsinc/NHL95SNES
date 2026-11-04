RedrawScrollList:					; redraws the visible scrolling list and its adjacent buffered rows
	lda.b a3+2
	inc a
	sta.b tmp1
	inc a
	sta.b tmp2
	lda.b a3+2
	sec
	adc.b a1+2
	pha
	lda.b a1+2
	beq RedrawScrollRowNext
	dec a
RedrawScrollRowNext:				; RedrawScrollList's loop: row A (from the one above the window) while
									; below both limits, on its wrapped text row through the row routine at
									; $75
	cmp.b $01,s
	bcs RedrawScrollListDone
	cmp.b a1
	bcs RedrawScrollListDone
	sta.b a3
.loop:								; loop: if A < tmp1 go to .1, A - tmp2, if the result >= 0 go to .loop
	cmp.b tmp1
	bcc .1
	sbc.b tmp2
	bpl .loop
.1:									; A + a4, a2+2 = A, call ClearTextRow, jump through $0075
	clc
	adc.b a4
	sta.b a2+2
	jsr.w ClearTextRow
	pea.w RedrawScrollRowDrawn-1
	jmp ($0075)
