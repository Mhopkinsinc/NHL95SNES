EvaluateTradePage:					; the Evaluate Trade text page (DrawGMDecision)
	dw $0010,$00F0,TxtEvaluateTrade&$FFFF,$0002
	dw TxtStartContinue&$FFFF,$8018
	dw TxtXCancel&$FFFF,$8019
	dw $FFFF,$0078
	dw TxtFor&$FFFF,$8006
	dw 0
