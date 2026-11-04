TradeListScrollEntries:				; the BG3 scroll HDMA entries at TradeScrollHDMA,y of trade list A's
									; window (one, or two when its first row wraps in the text rows); Y past
									; them
	tax
	lda.b $67,x
	inc a
	inc a
	sta.b tmp3
	lda.b $77,x
.loop:								; loop: if A < tmp3 go to .1, A - tmp3, if the result >= 0 go to .loop
	cmp.b tmp3
	bcc .1
	sbc.b tmp3
	bpl .loop
.1:									; if A is not $0000 go to .2, A = tmp3, A * 2, A * 2, ...
	cmp.w #$0000
	bne .2
	lda.b tmp3
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA,y
	lda.w #$FFFF
	sta.w TradeScrollHDMA+$1,y
	iny
	iny
	iny
	rts
.2:									; A * 2, A * 2, A * 2, TradeScrollHDMA+$3,y = A, ...
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA+$3,y
	tax
	lda.b tmp3
	asl a
	asl a
	asl a
	sec
	sbc.w TradeScrollHDMA+$3,y
	sta.w TradeScrollHDMA,y
	txa
	dec a
	sta.w TradeScrollHDMA+$1,y
	lda.w TradeScrollHDMA,y
	and.w #$00FF
	eor.w #$FFFF
	sta.w TradeScrollHDMA+$4,y
	tya
	clc
	adc.w #$0006
	tay
	rts
