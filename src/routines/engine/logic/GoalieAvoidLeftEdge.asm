GoalieAvoidLeftEdge:				; set the goalie target to the left avoidance edge
	lda.w #$FFDA
	sta.b d0
	rts
