SeasonTeamStatsInput:				; the Season Team Stats screen each frame (screen state 9): left / right
									; switch the team, start / select back to the League Menu
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$0013
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $0100 bit set go to .2, ...
	lda.w padchangeany
	bit.w #$0100
	bne .2
	bit.w #$0200
	bne .4
	bit.w #$3000
	beq .rts
	jsl.l FadeOutWait
	jmp.w SeasonOptions
.rts:								; return
	rts
.2:									; A = HomeTeam, A + 1, if A < $001A go to .3, A = $0000
	lda.w HomeTeam
	inc a
	cmp.w #$001A
	bcc .3
	lda.w #$0000
.3:									; HomeTeam = A, go to PrintSeasonTeamStats
	sta.w HomeTeam
	jmp.w PrintSeasonTeamStats
.4:									; A = HomeTeam, A - 1, if the result >= 0 go to .5, A = $0019
	lda.w HomeTeam
	dec a
	bpl .5
	lda.w #$0019
.5:									; HomeTeam = A, go to PrintSeasonTeamStats
	sta.w HomeTeam
	jmp.w PrintSeasonTeamStats
