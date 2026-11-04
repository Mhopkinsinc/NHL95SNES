AddGamePlayerStats:					; AddPlayerSeasonStats for both teams of game record Y (home, then away at
									; + $1A)
	tyx
	lda.l $7F0004,x
	sta.l HomeTeam
	lda.l $7F0002,x
	sta.l VisTeam
	phy
	pea.w $7E7E
	plb
	plb
	jsl.l RestoreWorkBuf
	jsl.l LoadGameRostersLong
	ply
	phy
	ldx.w #HomeRoster
	jsr.w AddPlayerSeasonStats
	pla
	clc
	adc.w #$001A
	tay
	ldx.w #VisRoster
	jsr.w AddPlayerSeasonStats
	rtl
