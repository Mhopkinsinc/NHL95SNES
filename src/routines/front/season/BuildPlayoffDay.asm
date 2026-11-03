BuildPlayoffDay:					; the day's playoff game records from the series still running (marked
									; ones for the user), then FinishSeasonDay; with none left
									; StanleyCupScreen, SeasonAwards and Reset
	lda.w #$0000
	sta.l SRDayPlayed
	jsl.l ResetWorkBuf
	jsr.w RebuildBracketTeams
	pea.w $7E7F
	plb
	ldy.w #$8EF8
	ldx.w #$001E
	stz.b tmp0
.loop:								; loop: $0004,y = $7E3D5E,x, if the result < 0 go to .2, A = X, ...
	lda.l $7E3D5E,x
	sta.w $0004,y
	ora.l $7E3D7C,x
	bmi .2
	txa
	stx.b tmp1
	lsr a
	tax
	sta.w $0038,y
	lda.l SRPOWins,x
	ldx.b tmp1
	and.w #$00FF
	cmp.w #$0040
	bcs .2
	and.w #$000F
	cmp.w #$0004
	bcs .2
	inc.b tmp0
	lda.l $7E3D7C,x
	sta.w $0002,y
	lda.w #$0000
	sta.w $0006,y
	sta.w $0008,y
	sta.w $000A,y
	sta.w $0000,y
	lda.l BracketSeriesMarks,x
	beq .1
	lda.w #$0001
	sta.w $0000,y
.1:									; A = Y, A + $010A, Y = A
	tya
	clc
	adc.w #$010A
	tay
.2:									; X - 1, X - 1, if the result >= 0 go to .loop, if tmp0 = 0 go to .3, ...
	dex
	dex
	bpl .loop
	lda.b tmp0
	beq .3
	sta.l $7E2C42
	jml.l FinishSeasonDay
.3:									; A = $0004, call PlayoffTeamAtRound, push A, A = $0003, ...
	plb
	lda.w #$0004
	jsr.w PlayoffTeamAtRound
	pha
	lda.w #$0003
	jsr.w PlayoffTeamAtRound
	tax
	pla
	jsl.l StanleyCupScreen
	jsl.l SeasonAwards
	jml.l Reset
