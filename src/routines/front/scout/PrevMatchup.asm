PrevMatchup:						; the previous matchup of the scouting report (before 0, 6), then
									; ShowMatchups
	lda.w curmatchup
	bne .1
	lda.w #$0007
.1:									; A - 1, curmatchup = A, go to ShowMatchups
	dec a
	sta.w curmatchup
	jmp.w ShowMatchups
