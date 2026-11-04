TradeScrollStepDown:				; moves trade list Y's scroll entries one line for ScrollTradeListDown; Y
									; past them
	lda.w TradeScrollHDMA+$1,y
	inc a
	sta.w TradeScrollHDMA+$1,y
	sep #$20
	lda.w TradeScrollHDMA,y
	dec a
	sta.w TradeScrollHDMA,y
	bne .1
	lda.b tmp2
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA,y
	rep #$20
	lda.w #$FFFF
	sta.w TradeScrollHDMA+$1,y
	iny
	iny
	iny
	rts
.1:									; A = tmp2, A * 2, A * 2, A * 2, ...
	lda.b tmp2
	asl a
	asl a
	asl a
	sec
	sbc.w TradeScrollHDMA,y
	sta.w TradeScrollHDMA+$3,y
	rep #$20
	lda.w TradeScrollHDMA,y
	and.w #$00FF
	eor.w #$FFFF
	sta.w TradeScrollHDMA+$4,y
	tya
	clc
	adc.w #$0006
	tay
	rts
