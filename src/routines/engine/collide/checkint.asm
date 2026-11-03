checkint:							; called from other segments
	jsl.l CheckGoalieInterference
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CheckGoalieInterference
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
GoalieInterferenceReturn:			; return from the goalie interference check
	rtl
