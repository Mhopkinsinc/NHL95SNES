DrawPenaltyRow:						; draws row a3 of ShowPenaltySummary's scrolling list: a penalty (period,
									; time, team, player, minutes)
	lda.b a3
	sta.b r2
	lda.w #$0003
	sta.b r1
	jsl.l Div16x8U
	asl a
	asl a
	sta.b a0+2
	tax
	lda.l RDMPYL
	beq .2
	dec a
	beq .1
	rts
.1:									; $CF = $0070, $D1 = $00E0, A = PenSum+3,x, A and $00FF, ...
	lda.w #$0070
	sta.b $CF
	lda.w #$00E0
	sta.b $D1
	lda.w PenSum+3,x
	and.w #$00FF
	tax
	lda.l Penaltylist,x
	sec
	adc.w #$4499
	inc a
	ldx.w #$00C3
	jsl.l CopyFlipString2
	ldy.b a2+2
	jsl.l PrintBoldRightStr
	rts
.2:									; $D5 = $2400, $CF = $0010, $D1 = $0030, A = PenSum+1,x, ...
	lda.w #$2400
	sta.b $D5
	lda.w #$0010
	sta.b $CF
	lda.w #$0030
	sta.b $D1
	lda.w PenSum+1,x
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
	lda.w #$0060
	sta.b $D1
	ldx.b a0+2
	lda.w PenSum,x
	and.w #$0FFF
	jsr.w TimeTextMSS
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	lda.w #$0080
	sta.b $D1
	ldx.b a0+2
	lda.w PenSum+2,x
	and.w #$0080
	beq .3
	pea.w VisRoster
	bra .4
.3:									; continue
	pea.w HomeRoster
.4:									; call TeamSecondText, Y = a2+2, call PrintBoldCentred, $CF = $D1, ...
	jsr.w TeamSecondText
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00E0
	sta.b $D1
	ldx.b a0+2
	lda.w PenSum+2,x
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
	lda.w #$000C
	jsr.w FitNameToMesarea
	ldy.b a2+2
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	lda.w #$00F8
	sta.b $D1
	ldx.b a0+2
	lda.w PenSum+3,x
	and.w #$00FF
	tax
	lda.l Penaltylist,x
	tax
	lda.l Penaltylist,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldCentredStr
	lda.w #$2000
	sta.b $D5
	rts
