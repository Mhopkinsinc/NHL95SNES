ClampGoalieTargetY:					; clamp the goalie target between goal lines and make its Y relative to d3
	lda.w Ypos,x
	cmp.w #$010E
	bpl .3
	cmp.w #$FEF2
	bmi .3
	cpx.w puckc
	bne .1
	stz.b d0
.1:									; if d1 - $0109 < 0 go to .2, d1 = $0109
	lda.b d1
	cmp.w #$0109
	bmi .2
	lda.w #$0109
	sta.b d1
.2:									; if d1 - $FEF7 >= 0 go to .3, d1 = $FEF7
	lda.b d1
	cmp.w #$FEF7
	bpl .3
	lda.w #$FEF7
	sta.b d1
.3:									; A = d1, A - d3, d1 = A
	lda.b d1
	sec
	sbc.b d3
	sta.b d1
GoalieTargetReturn:					; return from goalie targeting
	rtl
