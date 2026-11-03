ScanArtRoss:						; Art Ross Trophy: of all players, goalies skipped, the one with the most
									; goals + assists
	lda.w #$FFFF
	sta.w HomeTeam
	inc a
	sta.b a2
.loop:								; loop: a3 = A, A * 2, A + a3, A / 2, ...
	sta.b a3
	asl a
	adc.b a3
	lsr a
	tax
	lda.l SRPlayerTeams,x
	bcc .1
	lsr a
	lsr a
	lsr a
	lsr a
.1:									; A and $001F, if A >= $001A go to .3, if A = HomeTeam go to .2, ...
	and.w #$001F
	cmp.w #$001A
	bcs .3
	cmp.w HomeTeam
	beq .2
	sta.w HomeTeam
	pei ($6F)
	pei ($71)
	jsl.l LoadSeasonHomeRoster
	pla
	sta.b a3+2
	pla
	sta.b a3
.2:									; A = HomeRoster+2, A - 1, A * 2, X = A, ...
	lda.w HomeRoster+2
	dec a
	asl a
	tax
	lda.b a3
.loop2:								; loop: if A = HomeRoster+58,x go to .3, X - 1, X - 1, ...
	cmp.w HomeRoster+58,x
	beq .3
	dex
	dex
	bpl .loop2
	jsl.l SeasonGoalsLong
	lda.b tmp0
	sta.b tmp1
	lda.b a3
	jsl.l SeasonAssistsLong
	lda.b tmp0
	clc
	adc.b tmp1
	cmp.b a2
	bcc .3
	sta.b a2
	lda.b a3
	sta.b a3+2
.3:									; A = a3, A + 1, if A < $027E go to .loop, A = a3+2, ...
	lda.b a3
	inc a
	cmp.w #$027E
	bcc .loop
	lda.b a3+2
	rts
