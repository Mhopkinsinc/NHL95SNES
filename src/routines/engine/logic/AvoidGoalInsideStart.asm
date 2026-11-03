AvoidGoalInsideStart:				; choose a detour from inside the skater goal avoidance box
	lda.b p0+2
	cmp.w #$FEF2
	bpl AvoidGoalFromFront
AvoidGoalFromBehind:				; route a skater from behind the goal around an edge
	lda.b p0
	cmp.w #$FFCB
	bmi AvoidGoalLeftEdge
	cmp.w #$0036
	bpl AvoidGoalRightEdge
	lda.b r3
	sta.b d1
	bra AvoidGoalClampTargetX
