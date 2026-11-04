PlayShootout:						; the shootout: shootoutmode set, two options saved, the shooters of both
									; teams (InitShooters), the game and the period started, then rounds of a
									; shot a team (ShootoutTurn) until a team leads after 5
	lda.w #$0001
	sta.w shootoutmode
	lda.w OptLine
	pha
	stz.w OptLine
	lda.w OptPen
	pha
	stz.w OptPen
	jsl.l Create_HotCold_Table
	jsl.l LoadGameRostersLong
	jsl.l InitGameSpritesLong
	stz.b a2
	jsr.w InitShooters
	lda.w #$0002
	sta.b a2
	jsr.w InitShooters
	jsl.l StartGame_go
	jsl.l StartPer
	lda.w #$0001
	sta.w shootoutround
	stz.b d1
.loop:								; loop: shootoutdecider = 0, a2 = $0002, a1 = 0, call ShootoutTurn, ...
	stz.w shootoutdecider
	lda.w #$0002
	sta.b a2
	stz.b a1
	jsl.l ShootoutTurn
	lda.w shootoutround
	cmp.w #$0005
	bmi .1
	lda.w #$0001
	sta.w shootoutdecider
.1:									; a2 = 0, a1 = $0002, call ShootoutTurn, shootoutround + 1, ...
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l ShootoutTurn
	inc.w shootoutround
	lda.w shootoutround
	cmp.w #$0006
	bmi .loop
	lda.w tmscore
	cmp.w tmscore+2
	beq .loop
	stz.w shootoutmode
	pla
	sta.w OptPen
	pla
	sta.w OptLine
	rtl
