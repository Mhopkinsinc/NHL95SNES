GoalieAvoidInsideStart:				; choose a detour from inside the goalie avoidance box
	lda.b p0+2
	cmp.w #$FEF2
	bpl GoalieAvoidFromFront
GoalieAvoidFromBehind:				; route a goalie from behind the net around an edge
	lda.b p0
	cmp.w #$FFDB
	bmi GoalieAvoidLeftEdge
	cmp.w #$0026
	bpl GoalieAvoidRightEdge
	lda.b r3
	sta.b d1
	bra GoalieAvoidClampTargetX
