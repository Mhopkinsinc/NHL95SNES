GoalieCheckManualState:				; update the goalie control state before movement
	lda.w gmclock
	bne .1
	cpx.w puckc
	beq .1
	jmp.w GoalieCheckPadDirection
.1:									; A = goalieflags,x, A or $0001, goalieflags,x = A
	lda.w goalieflags,x
	ora.w #$0001
	sta.w goalieflags,x
GoalieUpdateStateJump:				; continue into the goalie animation and decision update
	jmp.w GoalieUpdateState
