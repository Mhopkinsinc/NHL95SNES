ScrollListUp:						; scrolls a scrolling list up a row (the pad's up) when rows are above
	lda.b a3+2
	inc a
	sta.b tmp1
	inc a
	sta.b tmp2
	lda.b a1+2
	beq ScrollListUpReturn
	dec a
	sta.b a1+2
	dec a
	bmi ScrollListUpAnim
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
	pea.w ScrollUpRowDrawn-1
	jmp ($0075)
