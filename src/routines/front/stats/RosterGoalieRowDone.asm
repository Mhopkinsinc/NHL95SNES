RosterGoalieRowDone:				; a goalie row drawn: the next row while goalies remain
	inc.b a2+2
	lda.b a3
	inc a
	sta.b a3
	ldx.b a0
	cmp.w $0002,x
	bne RosterGoalieRowNext
	rts
