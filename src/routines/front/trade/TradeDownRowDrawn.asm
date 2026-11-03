TradeDownRowDrawn:					; TradeCursorDown's row below drawn: SendTextMap, then ScrollTradeListDown
	jsl.l SendTextMap
	bra ScrollTradeListDown
