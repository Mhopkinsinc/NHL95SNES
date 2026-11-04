AvoidGoalRightHighY:				; route from the right high-Y corner of the mirrored skater box
	lda.b tmp1
	cmp.w #$0010
	bne AvoidGoalRightEdge
AvoidGoalSetHighY:					; set the target to the high-Y side of the mirrored skater box
	lda.b $42
	sta.b d1
	rts
