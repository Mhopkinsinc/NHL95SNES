TradeCursorDown:					; moves the cursor of team a2's trade list down a row (not past its count,
									; $7B), scrolling the list as TradeCursorUp does
	ldx.b a2
	lda.b $73,x
	sta.b d2
	lda.b $67,x
	inc a
	sta.b tmp1
	inc a
	sta.b tmp2
	lda.b a3+2
	clc
	sbc.b a3
	sbc.b a1
	dec a
	asl a
	asl a
	asl a
	pha
	lda.b $77,x
	clc
	adc.b $67,x
	cmp.b $7B,x
	bcs TradeCursorDownReturn
	phx
	inc a
	cmp.b $7B,x
	bcs ScrollTradeListDown
	sta.b d4+2
.loop:								; loop: if A < tmp1 go to .1, A - tmp2, if the result >= 0 go to .loop
	cmp.b tmp1
	bcc .1
	sbc.b tmp2
	bpl .loop
.1:									; A + $6F,x, a2+2 = A, call ClearTextRow, jump through $008F
	clc
	adc.b $6F,x
	sta.b a2+2
	jsr.w ClearTextRow
	pea.w TradeDownRowDrawn-1
	jmp ($008F)
