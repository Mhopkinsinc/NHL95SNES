wallcollb:							; from WallStraightEdges, WallCornerNormal and other segments
	cpx.w #$001C
	bne WallPlayerResponse
	lda.w puckz
	cmp.w #$0021
	bpl WallPuckOutResponse
	lda.w puckz
	cmp.w #$0016
	bcc WallPlayerResponse
	lda.w pucky
	cmp.w #$012F
	bmi WallPuckOutResponse
	lda.w puckx
	cmp.w #$000D
	bmi WallPlayerResponse
	lda.w puckx
	cmp.w #$0010
	bpl WallPlayerResponse
	lda.w puckvy
	cmp.w #$0FA0
	bmi WallPlayerResponse
	phx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	inx
	inx
	stx.b a3
	plx
	stx.b a3
	lda.l Crowdlevel
	clc
	adc.w #$0258
	sta.l Crowdlevel
	lda.w #$005A
	sta.b crowdhold
	lda.w CwdExciteLvl
	clc
	adc.w #$000F
	bmi wallcollb_out
	sta.w CwdExciteLvl
wallcollb_out:						; from wallcollb, WallPuckOutResponse
	lda.w #$0040
	tsb.w sflags
	sta.w pfnc+28
	lda.w pucky
	bpl .1
	lda.w #$8000
	tsb.w attribute+28
.1:									; frame+$1E = 0, if gmclock is not 0 go to .2, A = ltplayer, A * 2, ...
	stz.w frame+$1E
	lda.w gmclock
	bne .2
	lda.w ltplayer
	asl a
	sta.b a3
	tax
	lda.w #$0006
	sta.b d0
	jsl.l ShootoutWonBy
	ldx.w #$001C
	stx.b a3
.2:									; call EndPenaltyShot, breakaway = 0, onetimer = 0, return
	jsl.l EndPenaltyShot
	stz.w breakaway
	stz.w onetimer
	rtl
