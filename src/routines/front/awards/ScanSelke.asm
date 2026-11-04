ScanSelke:							; Selke Trophy: from the team FindFewestGoalsAllowedTeam picks, the
									; forward with the most goals + assists
	stz.b a2
	jsr.w FindFewestGoalsAllowedTeam
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
	stz.b a2
.loop:								; loop: A = HomeRoster+4, A - 1, if the result < 0 go to .1, ...
	lda.w HomeRoster+4
	dec a
	bmi .1
	beq .1
	sta.w HomeRoster+4
	clc
	adc.w HomeRoster+2
	asl a
	tax
	lda.w HomeRoster+60,x
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
