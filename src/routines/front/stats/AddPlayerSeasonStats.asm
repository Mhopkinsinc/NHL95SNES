AddPlayerSeasonStats:				; adds one team's game player stats to the season totals in save RAM:
									; skaters' goals and assists; for goalies who played, games + 1, goals
									; against and saves (shots minus goals)
	lda.w $0000,x
	sta.b $10
	lda.w $0002,x
	sta.b tmp2
	pea.w $7E7F
	plb
.1:									; tmp3 = $7E003A,x, $0A = X, $0C = Y, tmp2 - 1, ...
	lda.l $7E003A,x
	sta.b tmp3
	stx.b $0A
	sty.b $0C
	dec.b tmp2
	bpl .2
	jsl.l SeasonGoalsLong
	ldy.b $0C
	stx.b tmp0
	lda.w $003A,y
	and.w #$00FF
	clc
	adc.b tmp0
	tax
	lda.b tmp3
	jsr.w SetSeasonGoals
	lda.b tmp3
	jsl.l SeasonAssistsLong
	stx.b tmp0
	ldy.b $0C
	lda.w $006E,y
	and.w #$00FF
	clc
	adc.b tmp0
	tax
	lda.b tmp3
	jsr.w SetSeasonAssists
	bra .3
.2:									; A = $003A,y, A or $00A2,y, if the result = 0 go to .3, A = tmp3, ...
	lda.w $003A,y
	ora.w $00A2,y
	and.w #$00FF
	beq .3
	lda.b tmp3
	jsl.l SeasonGoalieGamesLong
	inx
	lda.b tmp3
	jsr.w SetSeasonGoalieGames
	lda.b tmp3
	jsl.l SeasonGoalsAgainstLong
	ldy.b $0C
	lda.w $003A,y
	and.w #$00FF
	sta.b $0E
	clc
	txa
	adc.b $0E
	tax
	lda.b tmp3
	jsr.w SetSeasonGoalsAgainst
	lda.b tmp3
	jsl.l SeasonSavesLong
	stx.b tmp0
	ldy.b $0C
	lda.w $00A2,y
	and.w #$00FF
	sec
	sbc.b $0E
	clc
	adc.b tmp0
	tax
	lda.b tmp3
	jsr.w SetSeasonSaves
.3:									; X = $0A, Y = $0C, X + 1, X + 1, ...
	ldx.b $0A
	ldy.b $0C
	inx
	inx
	iny
	dec.b $10
	beq .4
	jmp.w .1
.4:									; return
	plb
	rts
