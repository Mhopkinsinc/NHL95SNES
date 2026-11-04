ScanVezina:							; Vezina Trophy: of the goalies of the 26 teams, the one SeasonSavesLong
									; scores highest
	lda.w #$0000
	sta.b a2
.1:									; a2+2 = A, HomeTeam = A, call LoadSeasonHomeRoster
	sta.b a2+2
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
.loop:								; loop: A = HomeRoster+2, A - 1, if the result < 0 go to .2, ...
	lda.w HomeRoster+2
	dec a
	bmi .2
	sta.w HomeRoster+2
	asl a
	tax
	lda.w HomeRoster+58,x
	sta.b a3
	jsl.l SeasonSavesLong
	lda.b tmp0
	cmp.b a2
	bcc .loop
	sta.b a2
	lda.b a3
	sta.b a3+2
	bra .loop
.2:									; A = a2+2, A + 1, if A is not $001A go to .1, A = a3+2, ...
	lda.b a2+2
	inc a
	cmp.w #$001A
	bne .1
	lda.b a3+2
	rts
