GoalieAvoidLeftSide:				; route from the left side of the mirrored goalie box
	lda.w #$FFDA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq GoalieAvoidSetHighY
	rts
