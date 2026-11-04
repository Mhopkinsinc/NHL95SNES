AvoidGoalRightSide:					; route from the right side of the mirrored skater box
	lda.w #$0036
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq AvoidGoalSetHighY
	rts
