TradeRowDrawn:						; the row routine returns here: WaitTransfers, RestoreWorkBuf, the next
									; row
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	lda.b d4+2
	inc a
	bra DrawTradeRowNext
