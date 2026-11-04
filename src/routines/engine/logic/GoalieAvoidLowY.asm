GoalieAvoidLowY:					; route from the low-Y side of the mirrored goalie box
	lda.b r3
	sta.b d1
	lda.b tmp1
	and.w #$0002
	bne GoalieAvoidClampTargetX
	rts
