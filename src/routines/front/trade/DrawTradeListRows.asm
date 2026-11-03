DrawTradeListRows:					; draws a trade list's rows from $91 - 1 to just below its window (A rows
									; shown, X the count), each on its row of the list's wrapping text rows
									; from Y, through the row routine at $8F
	phy
	phx
	tay
	inc a
	sta.b tmp1
	inc a
	sta.b tmp2
	tya
	sec
	adc.b d4+2
	pha
	lda.b d4+2
	beq DrawTradeRowNext
	dec a
DrawTradeRowNext:					; DrawTradeListRows' loop: row A while below both limits
	cmp.b $01,s
	bcs DrawTradeListRowsDone
	cmp.b $03,s
	bcs DrawTradeListRowsDone
	sta.b d4+2
.loop:								; loop: if A < tmp1 go to .1, A - tmp2, if the result >= 0 go to .loop
	cmp.b tmp1
	bcc .1
	sbc.b tmp2
	bpl .loop
.1:									; A + $05,s, a2+2 = A, call ClearTextRow, jump through $008F
	clc
	adc.b $05,s
	sta.b a2+2
	jsr.w ClearTextRow
	pea.w TradeRowDrawn-1
	jmp ($008F)
