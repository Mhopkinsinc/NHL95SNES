InvalidatePuckGoalCrossing:			; mark the selected puck goal crossing time invalid
	lda.w #$FFFF
	sta.w puckcross+2,y
	rtl
