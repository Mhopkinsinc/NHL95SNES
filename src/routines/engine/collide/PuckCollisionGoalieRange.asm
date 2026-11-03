PuckCollisionGoalieRange:			; test the close puck-to-player range before puckgoalie
	lda.w Xpos,y
	sec
	sbc.w puckx
	sta.b d0
	cmp.w #$FFF5
	bmi PuckCollisionRestore
	cmp.w #$000B
	bpl PuckCollisionRestore
	lda.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	cmp.w #$FFF5
	bmi PuckCollisionRestore
	cmp.w #$000B
	bpl PuckCollisionRestore
	jsl.l puckgoalie
	bra PuckCollisionRestore
