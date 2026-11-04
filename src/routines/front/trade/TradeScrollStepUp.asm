TradeScrollStepUp:					; moves trade list Y's scroll entries one line for ScrollTradeListUp; Y
									; past them
	sep #$20
	lda.b tmp2
	asl a
	asl a
	asl a
	cmp.w TradeScrollHDMA,y
	bne .2
	dec a
	sta.w TradeScrollHDMA+$3,y
	lda.b #$01
	sta.w TradeScrollHDMA,y
	rep #$20
	lda.w TradeScrollHDMA+$1,y
	dec a
	sta.w TradeScrollHDMA+$4,y
	lda.b tmp2
	asl a
	asl a
	asl a
	dec a
	dec a
	sta.w TradeScrollHDMA+$1,y
.1:									; A = Y, A + $0006, Y = A, return
	tya
	clc
	adc.w #$0006
	tay
	rts
.2:									; A = TradeScrollHDMA,y, A + 1, TradeScrollHDMA,y = A, ...
	lda.w TradeScrollHDMA,y
	inc a
	sta.w TradeScrollHDMA,y
	lda.w TradeScrollHDMA+$3,y
	dec a
	sta.w TradeScrollHDMA+$3,y
	rep #$20
	lda.w TradeScrollHDMA+$1,y
	dec a
	sta.w TradeScrollHDMA+$1,y
	lda.w TradeScrollHDMA+$4,y
	dec a
	sta.w TradeScrollHDMA+$4,y
	lda.w TradeScrollHDMA+$3,y
	and.w #$00FF
	bne .1
	iny
	iny
	iny
	rts
