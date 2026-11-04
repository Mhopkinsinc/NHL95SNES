PlayoffValues:						; the Playoffs values: a count (2), then texts Single Game and a multi
									; game series
	dw 2
	dw TxtSingleGame&$FFFF,TxtMultiGame&$FFFF
