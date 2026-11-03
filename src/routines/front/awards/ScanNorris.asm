ScanNorris:							; Norris Trophy: from the team FindFewestGoalsAllowedTeam picks, the
									; defenceman with the most goals + assists
	stz.b a2
	jsr.w FindFewestGoalsAllowedTeam
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
	stz.b a2
.loop:								; loop: A = HomeRoster+6, A - 1, if the result = 0 go to .1, ...
	lda.w HomeRoster+6
	dec a
	beq .1
	sta.w HomeRoster+6
	clc
	adc.w HomeRoster+2
	adc.w HomeRoster+4
	asl a
	tax
	lda.w HomeRoster+58,x
	sta.b a3
	jsl.l SeasonGoalsLong
	lda.b tmp0
	sta.b tmp1
	lda.b a3
	jsl.l SeasonAssistsLong
	lda.b tmp0
	clc
	adc.b tmp1
	cmp.b a2
	bcc .loop
	sta.b a2
	lda.b a3
	sta.b a3+2
	bra .loop
.1:									; A = a3+2, return
	lda.b a3+2
	rts
