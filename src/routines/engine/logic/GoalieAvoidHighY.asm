GoalieAvoidHighY:					; route from the high-Y side of the mirrored goalie box
	lda.b $42
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne GoalieAvoidReturn
GoalieAvoidClampTargetX:			; move an interior goalie target X to the nearest box edge
	lda.b p1
	bpl .1
	cmp.w #$FFDB
	bmi GoalieAvoidReturn
	lda.w #$FFDA
	sta.b d0
	rts
.1:									; if A - $0026 >= 0 go to GoalieAvoidReturn, d0 = $0026
	cmp.w #$0026
	bpl GoalieAvoidReturn
	lda.w #$0026
	sta.b d0
GoalieAvoidReturn:					; return from a goalie goal avoidance handler
	rts
