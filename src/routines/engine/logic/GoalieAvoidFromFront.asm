GoalieAvoidFromFront:				; route a goalie from in front of the net
	lda.b tmp1
	bit.w #$0002
	bne GoalieAvoidReturn
GoalieAvoidFarBoundary:				; route the goalie along the far box boundary
	lda.b $42
	sta.b d1
	bra GoalieAvoidClampTargetX
