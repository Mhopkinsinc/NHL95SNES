SaveDayGameStats:					; for each of the day's games not played by a user: AddTeamSeasonStats for
									; both teams, the score to SRDayScores, AddGamePlayerStats; then
									; SRDayPlayed rebuilt
	pea.w $7E7F
	lda.w DayGameCount
	sta.b tmp0
	lda.l SRDayPlayed
	sta.b $0A
	stz.b $0C
	stz.b $0E
	plb
	ldy.w #$8EF8
.loop:								; loop: X = Y, $0A / 2, if carry set go to .1, ...
	tyx
	lsr.b $0A
	bcs .1
	lda.w $0000,y
	bne .1
	lda.w $0002,y
	jsr.w AddTeamSeasonStats
	tya
	clc
	adc.w #$0016
	tax
	lda.w $0004,y
	jsr.w AddTeamSeasonStats
	lda.b $0E
	asl a
	tax
	lda.w $0008,y
	xba
	ora.w $000A,y
	sta.l SRDayScores,x
	phx
	phy
	pei ($9F)
	pei ($A1)
	pei ($A3)
	pei ($A5)
	pei ($0A)
	pei ($0C)
	pei ($0E)
	phb
	jsl.l AddGamePlayerStats
	plb
	pla
	sta.b $0E
	pla
	sta.b $0C
	pla
	sta.b $0A
	pla
	sta.b tmp3
	pla
	sta.b tmp2
	pla
	sta.b tmp1
	pla
	sta.b tmp0
	ply
	plx
	sec
.1:									; A = Y, A + $010A, Y = A, $0E + 1, ...
	ror.b $0C
	tya
	adc.w #$010A
	tay
	inc.b $0E
	dec.b tmp0
	bne .loop
	plb
	lda.w #$0010
	sbc.w DayGameCount
.loop2:								; loop: $0C / 2, A - 1, if the result >= 0 go to .loop2, ...
	lsr.b $0C
	dec a
	bpl .loop2
	lda.b $0C
	sta.l SRDayPlayed
	rts
