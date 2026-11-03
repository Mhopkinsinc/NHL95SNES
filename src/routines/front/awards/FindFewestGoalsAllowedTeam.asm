FindFewestGoalsAllowedTeam:			; returns in A (and $71) the team with the fewest goals allowed this
									; season (BuildTeamSeasonRecord field $2A)
	lda.w #$0000
	sta.b a2
	sta.b a3+2
	dec.b a2
.loop:								; loop: a2+2 = A, call BuildTeamSeasonRecordLong, ...
	sta.b a2+2
	jsl.l BuildTeamSeasonRecordLong
	lda.w $002A,x
	cmp.b a2
	bcs .1
	sta.b a2
	lda.b a2+2
	sta.b a3+2
.1:									; A = a2+2, A + 1, if A is not $001A go to .loop, A = a3+2, ...
	lda.b a2+2
	inc a
	cmp.w #$001A
	bne .loop
	lda.b a3+2
	rts
