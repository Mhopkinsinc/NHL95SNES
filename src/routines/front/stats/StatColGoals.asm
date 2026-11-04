StatColGoals:						; PlayerStatColumn's goals column (tmgoals)
	plx
	lda.w tmgoals,x
	and.w #$00FF
	rts
