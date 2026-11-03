AvoidGoalLeftHighY:					; route from the left high-Y corner of the mirrored skater box
	lda.b tmp1
	cmp.w #$0004
	beq AvoidGoalSetHighY
	lda.w #$FFCA
	sta.b d0
	rts
