AvoidGoalHighY:						; route from the high-Y side of the mirrored skater box
	lda.b $42
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne AvoidGoalReturn
AvoidGoalClampTargetX:				; move an interior target X to the nearest side of the avoidance box
	lda.b p1
	bpl .1
	cmp.w #$FFCB
	bmi AvoidGoalReturn
	lda.w #$FFCA
	sta.b d0
	rts
.1:									; if A - $0036 >= 0 go to AvoidGoalReturn, d0 = $0036
	cmp.w #$0036
	bpl AvoidGoalReturn
	lda.w #$0036
	sta.b d0
AvoidGoalReturn:					; return from a skater goal avoidance handler
	rts
