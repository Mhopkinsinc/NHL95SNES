AvoidGoalFromFront:					; route a skater from in front of the goal around the goalie
	lda.b p1+2
	cmp.w #$FEF2
	bpl .1
	lda.b $46
	sta.b d1
	ldy.b $44
	bmi AvoidGoalClampTargetX
	lda.b p0
	cmp.w Xpos,y
	bmi AvoidGoalLeftEdge
	bra AvoidGoalRightEdge
.1:									; if $44 < 0 go to AvoidGoalReturn
	ldy.b $44
	bmi AvoidGoalReturn
AvoidGoalCrossGoalie:				; test whether the skating path crosses the goalie horizontally
	lda.b p1
	sec
	sbc.w Xpos,y
	pha
	lda.b p0
	sec
	sbc.b p1
	eor.b $01,s
	bpl AvoidGoalPopReturn
	pla
	lda.b p0
	cmp.w Xpos,y
	bpl AvoidGoalRightEdge
	bra AvoidGoalLeftCrossing
