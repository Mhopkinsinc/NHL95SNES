DrawScoringRow:						; draws row a3 of ScoringSummaryScreen's scrolling list: a goal (period,
									; time, team, scorer and assists)
	lda.b a3
	sta.b r2
	lda.w #$0003
	sta.b r1
	jsl.l Div16x8U
	asl a
	sta.b a0+2
	asl a
	adc.b a0+2
	sta.b a0+2
	tax
	lda.w ScoreSum+2,x
	and.w #$0080
	beq .1
	pea.w VisRoster
	bra .2
.1:									; continue
	pea.w HomeRoster
.2:									; $CF = $007A, $D1 = $00E0, if RDMPYL = 0 go to .6, A - 1, ...
	lda.w #$007A
	sta.b $CF
	lda.w #$00E0
	sta.b $D1
	lda.l RDMPYL
	beq .6
	dec a
	beq .3
	lda.w ScoreSum+5,x
	bra .4
.3:									; A = $203E,x
	lda.w ScoreSum+4,x
.4:									; A and $00FF, if A = $00FF go to .5, A * 2, A * 2, ...
	and.w #$00FF
	cmp.w #$00FF
	beq .5
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $01,s
	adc.w #$0118
	tax
	lda.w #$000C
	jsr.w FitNameToMesarea
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
.5:									; pull X, return
	plx
	rts
.6:									; $D5 = $2400, $CF = $0009, $D1 = $0029, A = $7E203B,x, ...
	lda.w #$2400
	sta.b $D5
	lda.w #$0009
	sta.b $CF
	lda.w #$0029
	sta.b $D1
	lda.l $7E203B,x
	and.w #$00C0
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	lda.l PerLabels,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$0050
	sta.b $D1
	ldx.b a0+2
	lda.l $7E203A,x
	and.w #$0FFF
	jsr.w TimeTextMSS
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	lda.w #$0068
	sta.b $D1
	ldx.b a0+2
	lda.l $7E203C,x
	and.w #$0080
	jsr.w TeamSecondText
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.w #$0072
	sta.b $CF
	ldx.b a0+2
	lda.l $7E203D,x
	and.w #$007F
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $01,s
	adc.w #$0118
	plx
	tax
	lda.w #$000D
	jsr.w FitNameToMesarea
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.w #$00E0
	sta.b $CF
	ldx.b a0+2
	lda.l $7E203C,x
	and.w #$0007
	cmp.w #$0005
	bcc .7
	lda.w #$0002
.7:									; A * 2, X = A, if ScoringStrengthTexts,x = $FFFF go to .8, X = A, ...
	asl a
	tax
	lda.l ScoringStrengthTexts,x
	cmp.w #$FFFF
	beq .8
	tax
	ldy.b a2+2
	jsl.l PrintBoldLeft
.8:									; $D5 = $2000, return
	lda.w #$2000
	sta.b $D5
	rts
