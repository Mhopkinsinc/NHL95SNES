GoalieAvoidRightSide:				; route from the right side of the mirrored goalie box
	lda.w #$0026
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq GoalieAvoidSetHighY
	rts
