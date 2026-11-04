CheckGoalieInterference:			; check one player against goalie a2 for a fall and interference penalty
	ldy.b a2
	lda.w position,y
	bne GoalieInterferenceReturn
	lda.w gmclock
	bne GoalieInterferenceReturn
	lda.w puckc
	cmp.b a3
	beq .1
	lda.w impact,x
	sec
	sbc.w #$001A
	bmi GoalieInterferenceReturn
.1:									; A = impact,x, A - $0003, if the result < 0 go to
									; GoalieInterferenceReturn, ...
	lda.w impact,x
	sec
	sbc.w #$0003
	bmi GoalieInterferenceReturn
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l FallDown
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w impact,y
	sec
	sbc.w #$001F
	bmi GoalieInterferenceReturn
	lda.w pflags,x
	bit.w #$4000
	bne GoalieInterferenceReturn
	lda.w #$0014
	sec
	sbc.w aggress,x
	jsl.l randoma8
	cmp.w #$0002
	bcs GoalieInterferenceReturn
	lda.w gmode
	bit.w #$0010
	bne GoalieInterferenceReturn
	lda.w goalieflags,y
	and.w #$0004
	bne GoalieInterferenceReturn
	lda.w #$0026
	sta.b d0
	jmp.w AddPenalty
