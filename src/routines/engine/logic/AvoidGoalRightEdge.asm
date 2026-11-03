AvoidGoalRightEdge:					; set the skating target to the right edge of the goal avoidance box
	lda.w #$0036
	sta.b d0
	rts
