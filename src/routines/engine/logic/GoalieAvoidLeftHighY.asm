GoalieAvoidLeftHighY:				; route from the left high-Y corner of the mirrored goalie box
	lda.b tmp1
	cmp.w #$0004
	beq GoalieAvoidSetHighY
	lda.w #$FFDA
	sta.b d0
	rts
