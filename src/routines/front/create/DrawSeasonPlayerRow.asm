DrawSeasonPlayerRow:				; draws row a3 of the Season Player Stats list: a player and his season
									; stats
	lda.w #$000C
	sta.b $CF
	lda.b d0
	bne .1
	jmp.w .3
.1:									; A = a3, A * 2, X = A, push X, ...
	clc
	lda.b a3
	asl a
	tax
	phx
	asl a
	asl a
	asl a
	asl a
	adc.w #$2EE1
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	plx
	lda.w HomeRoster+58,x
	pha
	jsr.w PlayerNumberBCD
	jsr.w BCDDigits4
	lda.w #$0072
	sta.b $CF
	ldx.w #mesarea+2
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.w #$0093
	sta.b $CF
	lda.b $01,s
	jsr.w SeasonSaves
	pei ($9F)
	pha
	jsr.w PrintRowBCD
	lda.w #$00B5
	sta.b $CF
	lda.b $05,s
	jsr.w SeasonGoalsAgainst
	pei ($9F)
	clc
	sed
	adc.b $03,s
	cld
	jsr.w PrintRowBCD
	lda.w #$00D7
	sta.b $CF
	clc
	lda.b $05,s
	tax
	lda.w #$0064
	jsl.l Mul16x8U
	stz.b r1+2
	clc
	lda.b $05,s
	adc.b $01,s
	sta.b r1
	beq .2
	jsl.l Div32x32U
	lda.b r0
.2:									; call BinToBCD, pull X, pull X, pull X, ...
	jsr.w BinToBCD
	plx
	plx
	plx
	plx
	jmp.w PrintRowBCD
.3:									; A = HomeRoster+2, A + a3, A * 2, X = A, ...
	clc
	lda.w HomeRoster+2
	adc.b a3
	asl a
	tax
	phx
	asl a
	asl a
	asl a
	asl a
	adc.w #$2EE1
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	plx
	lda.w HomeRoster+58,x
	pha
	jsr.w PlayerNumberBCD
	jsr.w BCDDigits4
	lda.w #$0072
	sta.b $CF
	ldx.w #mesarea+2
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.w #$0093
	sta.b $CF
	lda.b $01,s
	jsr.w SeasonGoals
	pha
	jsr.w PrintRowBCD
	lda.w #$00B5
	sta.b $CF
	lda.b $03,s
	jsr.w SeasonAssists
	pha
	jsr.w PrintRowBCD
	lda.w #$00D7
	sta.b $CF
	clc
	sed
	pla
	adc.b $01,s
	cld
	plx
	plx
PrintRowBCD:						; BCDText of A printed bold at the list row $6D (x $CF)
	jsr.w BCDText
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	rts
