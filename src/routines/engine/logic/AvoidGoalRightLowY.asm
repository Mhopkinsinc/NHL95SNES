AvoidGoalRightLowY:					; route from the right low-Y corner of the mirrored skater box
	lda.b tmp1
	cmp.w #$0010
	bne AvoidGoalRightEdge
AvoidGoalSetLowY:					; set the target to the low-Y side of the mirrored skater box
	lda.b r3
	sta.b d1
	rts
