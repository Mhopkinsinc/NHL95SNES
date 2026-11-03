GoalieAvoidRightLowY:				; route from the right low-Y corner of the mirrored goalie box
	lda.b tmp1
	cmp.w #$0010
	bne GoalieAvoidRightEdge
GoalieAvoidSetLowY:					; set the target to the low-Y side of the mirrored goalie box
	lda.b r3
	sta.b d1
	rts
