TradeUpRowDrawn:					; TradeCursorUp's row above drawn: SendTextMap, then ScrollTradeListUp
	jsl.l SendTextMap
	bra ScrollTradeListUp
