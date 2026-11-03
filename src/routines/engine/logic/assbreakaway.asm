assbreakaway:						; assignment (asstab entry 16): the puck carrier on a breakaway; others
									; and pad players leave through assexit
	cpx.w puckc
	bne .1
	lda.w playerpad,x
	bmi BreakawayFollowPath
.1:									; go to assexit
	jmp.w assexit
	rtl								; unreached: no code branches, falls or points here
