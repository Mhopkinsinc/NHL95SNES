AvoidGoalLeftEdge:					; set the skating target to the left edge of the goal avoidance box
	lda.w #$FFCA
	sta.b d0
	rts
