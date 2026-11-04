ScrollListDown:						; scrolls a scrolling list down a row (the pad's down) when rows are below
	lda.b a3+2
	inc a
	sta.b tmp1
	inc a
	sta.b tmp2
	lda.b a1+2
	clc
	adc.b a3+2
	cmp.b a1
	bcs ScrollListDownReturn
	inc a
	cmp.b a1
	bcs ScrollListDownAnim
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
	pea.w ScrollDownRowDrawn-1
	jmp ($0075)
