UpdatePuckGoalCrossings:			; predict puck crossings of both goal lines
	phx
	lda.w #$010E
	sta.b d4
	ldy.w #$0000
	jsl.l PredictPuckGoalCrossing
	lda.w #$FEF2
	sta.b d4
	ldy.w #$0004
	jsl.l PredictPuckGoalCrossing
	plx
	rtl
