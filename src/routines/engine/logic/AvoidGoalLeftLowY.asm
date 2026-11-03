AvoidGoalLeftLowY:					; route from the left low-Y corner of the mirrored skater box
	lda.b tmp1
	cmp.w #$0004
	beq AvoidGoalSetLowY
AvoidGoalLeftCrossing:				; set the left-edge detour after a goalie crossing test
	lda.w #$FFCA
	sta.b d0
	rts
