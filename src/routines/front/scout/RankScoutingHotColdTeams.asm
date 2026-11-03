RankScoutingHotColdTeams:			; ranks both teams' hot and cold players and selects the hotter team
	stz.b a2
	ldy.w #HomeHotCold
	ldx.w #HomeRoster
	jsr.w RankScoutingHotColdPlayers
	lda.w #$0002
	sta.b a2
	ldy.w #VisHotCold
	ldx.w #VisRoster
	jsr.w RankScoutingHotColdPlayers
	ldx.w HomeTeam
	lda.w HomeHotCold+12
	sec
	sbc.w VisHotCold+12
	bpl .1
	ldx.w VisTeam
	eor.w #$FFFF
	inc a
.1:									; hotterteam = X, X = A, A = $8000, if X >= $0008 go to .3, ...
	stx.w hotterteam
	tax
	lda.w #$8000
	cpx.w #$0008
	bcs .3
	cpx.w #$0004
	bcs .2
	ldx.w #$FFFF
	stx.w hotterteam
.2:									; A * 2
	asl a
.3:									; return
	tsb.w hotterteam
	rts
