RedrawTradeLists:					; draws both trade lists again and rebuilds the scroll table
									; (TradeScrollHDMA) for their windows
	lda.b $77
	sta.b d4+2
	lda.b a4
	sta.b d2
	ldy.b a3
	ldx.b $7B
	lda.b a1
	jsr.w DrawTradeListRows
	lda.b $79
	sta.b d4+2
	lda.b $75
	sta.b d2
	ldy.b a3+2
	ldx.b $7D
	lda.b a1+2
	jsr.w DrawTradeListRows
	ldy.w #$0003
	lda.w #$0000
	jsr.w TradeListScrollEntries
	lda.b a3+2
	clc
	sbc.b a3
	sbc.b a1
	dec a
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA,y
	lda.w #$FFFF
	sta.w TradeScrollHDMA+$1,y
	iny
	iny
	iny
	lda.w #$0002
	jsr.w TradeListScrollEntries
	lda.w #$0001
	sta.w TradeScrollHDMA,y
	dec a
	sta.w TradeScrollHDMA+$3,y
	dec a
	sta.w TradeScrollHDMA+$1,y
	rts
