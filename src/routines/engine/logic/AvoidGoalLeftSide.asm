AvoidGoalLeftSide:					; route from the left side of the mirrored skater box
	lda.w #$FFCA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq AvoidGoalSetHighY
	rts
