SeasonGameOver:						; after the user's season game: its game record (the first one in use at
									; $7F8EF8) marked played in SRDayPlayed, the scores and team stats copied
									; in, then the result and the season stats (outside play mode 3)
	ldy.w #$0000
	tyx
	clc
	bra .1
.loop:								; loop: Y + 1, A = X, A + $010A, X = A
	iny
	txa
	adc.w #$010A
	tax
.1:									; if $7F8EF8,x = 0 go to .loop, tmp1 = X, A = Y, A * 2, ...
	lda.l $7F8EF8,x
	beq .loop
	stx.b tmp1
	tya
	asl a
	tax
	lda.l SRDayPlayed
	ora.l BitMaskTable,x
	sta.l SRDayPlayed
	ldx.b tmp1
	lda.w tmscore
	sta.l $7F8F02,x
	sta.l $7F8F1A,x
	sta.l $7F8F16,x
	sta.b tmp0
	lda.w tmscore+2
	sta.l $7F8F00,x
	sta.l $7F8F04,x
	sta.l $7F8F2C,x
	xba
	tsb.b tmp0
	lda.w tmshots
	sta.l $7F8F1C,x
	sta.l $7F8F18,x
	lda.w tmshots+2
	sta.l $7F8F06,x
	sta.l $7F8F2E,x
	lda.w tmchecks
	sta.l $7F8F1E,x
	lda.w tmchecks+2
	sta.l $7F8F08,x
	lda.w tmPwrPlays
	sta.l $7F8F20,x
	lda.w tmPwrPlays+2
	sta.l $7F8F0A,x
	lda.w tmPwrGoals
	sta.l $7F8F22,x
	lda.w tmPwrGoals+2
	sta.l $7F8F0C,x
	lda.w tmSHShots
	sta.l $7F8F24,x
	lda.w tmSHShots+2
	sta.l $7F8F0E,x
	lda.w tmSHGoals
	sta.l $7F8F26,x
	lda.w tmSHGoals+2
	sta.l $7F8F10,x
	lda.w tmOneTimerGoals
	sta.l $7F8F28,x
	lda.w tmOneTimerGoals+2
	sta.l $7F8F12,x
	lda.w tmOneTimerSwings
	sta.l $7F8F2A,x
	lda.w tmOneTimerSwings+2
	sta.l $7F8F14,x
	lda.w #$0000
	sta.l $7F8EF8,x
	dec a
	sta.l $7F8EFE,x
	tya
	asl a
	tax
	lda.b tmp0
	sta.l SRDayScores,x
	clc
	lda.b tmp1
	adc.w #$8F32
	tay
	ldx.w #$1413
	lda.w #$00CF
	phb
	mvn $7F,$00
	plb
	lda.w OptPlayMode
	cmp.w #$0003
	beq .rts
	pea.w $7E7F
	plb
	lda.b tmp1
	clc
	adc.w #$8EF8
	tay
	jsr.w RecordGameResult
	tyx
	lda.w $0002,y
	jsr.w AddTeamSeasonStats
	tya
	clc
	adc.w #$0016
	tax
	lda.w $0004,y
	jsr.w AddTeamSeasonStats
	plb
	jsl.l AddGamePlayerStats
.rts:								; return
	rts
