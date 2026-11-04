NextMatchup:						; the next matchup of the scouting report (after 6, 0), then ShowMatchups
	lda.w curmatchup
	inc a
	cmp.w #$0007
	bcc .1
	lda.w #$0000
.1:									; curmatchup = A, go to ShowMatchups
	sta.w curmatchup
	jmp.w ShowMatchups
