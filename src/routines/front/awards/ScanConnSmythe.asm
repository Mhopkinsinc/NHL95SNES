ScanConnSmythe:						; Conn Smythe Trophy: of the skaters of the 16 playoff teams, the one with
									; the highest playoff goals + assists
	lda.w #$0000
	sta.b a2
.1:									; a2+2 = A, X = A, A = SRPOTeams,x, A and $00FF, ...
	sta.b a2+2
	tax
	lda.l SRPOTeams,x
	and.w #$00FF
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
	lda.w HomeRoster
	clc
	sbc.w HomeRoster+2
	sta.w HomeRoster
.loop:								; loop: A = HomeRoster, A - 1, if the result < 0 go to .2, ...
	lda.w HomeRoster
	dec a
	bmi .2
	sta.w HomeRoster
	ldx.b a2+2
	sec
	adc.w HomeRoster+2
	pha
	jsr.w ReadPlayoffPlayerGoals
	sta.b tmp2
	pla
	ldx.b a2+2
	jsr.w ReadPlayoffPlayerAssists
	clc
	adc.b tmp2
	cmp.b a2
	bcc .loop
	sta.b a2
	lda.w HomeRoster
	sec
	adc.w HomeRoster+2
	asl a
	tax
	lda.w HomeRoster+58,x
	sta.b a3+2
	bra .loop
.2:									; A = a2+2, A + 1, if A < $0010 go to .1, A = a3+2, ...
	lda.b a2+2
	inc a
	cmp.w #$0010
	bcc .1
	lda.b a3+2
	rts
