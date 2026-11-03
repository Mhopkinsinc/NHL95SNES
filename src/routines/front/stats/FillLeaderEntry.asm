FillLeaderEntry:					; fills the leader entry at Y for player A: number and team, then goals /
									; assists / points or, for a goalie, saves / shots / save percentage
	pha
	sta.w $0004,y
	jsr.w PlayerNumberTeam
	sta.w $000E,y
	lda.b $01,s
	jsr.w IsSkater
	bcc .1
	lda.b $01,s
	jsr.w SeasonGoals
	sta.w $0008,y
	lda.b $01,s
	jsr.w SeasonAssists
	sta.w $000A,y
	clc
	sed
	lda.w $0008,y
	adc.w $000A,y
	sta.w $000C,y
	cld
	tyx
	stz.w $0006,x
	pla
	sta.b tmp0
	rts
.1:									; $0006,y = $0001, A = $01,s, call SeasonSaves, $0008,y = A, ...
	lda.w #$0001
	sta.w $0006,y
	lda.b $01,s
	jsr.w SeasonSaves
	sta.w $0008,y
	pei ($9F)
	pei ($9F)
	lda.b $05,s
	jsr.w SeasonGoalsAgainst
	clc
	sed
	adc.w $0008,y
	sta.w $000A,y
	cld
	plx
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	stz.b r1+2
	pla
	clc
	adc.b tmp0
	sta.b r1
	beq .2
	phy
	jsl.l Div32x32U
	ply
	lda.b r0
.2:									; call BinToBCD, $000C,y = A, pull A, tmp0 = A, ...
	jsr.w BinToBCD
	sta.w $000C,y
	pla
	sta.b tmp0
	rts
