GoalieAvoidLeftLowY:				; route from the left low-Y corner of the mirrored goalie box
	lda.b tmp1
	cmp.w #$0004
	beq GoalieAvoidSetLowY
	lda.w #$FFDA
	sta.b d0
	rts
