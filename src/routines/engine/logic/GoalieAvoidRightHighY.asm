GoalieAvoidRightHighY:				; route from the right high-Y corner of the mirrored goalie box
	lda.b tmp1
	cmp.w #$0010
	bne GoalieAvoidRightEdge
GoalieAvoidSetHighY:				; set the target to the high-Y side of the mirrored goalie box
	lda.b $42
	sta.b d1
	rts
