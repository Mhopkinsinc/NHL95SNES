PrintPositionCounts:				; prints the goalie, defence and forward counts (d0, d1, $81) on rows 6-8
									; and their total on row 9
	ldx.b $D3
	stz.w $019C,x
	stz.w $019E,x
	stz.w $01A0,x
	stz.w $01DC,x
	stz.w $01DE,x
	stz.w $01E0,x
	stz.w $021C,x
	stz.w $021E,x
	stz.w $0220,x
	stz.w $025C,x
	stz.w $025E,x
	stz.w $0260,x
	lda.w #$0070
	sta.b $CF
	ldx.b d0
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$0006
	jsl.l PrintBoldLeftStr
	ldx.b d1
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$0007
	jsl.l PrintBoldLeftStr
	ldx.b d0+2
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$0008
	jsl.l PrintBoldLeftStr
	lda.b d0
	clc
	adc.b d1
	adc.b d0+2
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$0009
	jsl.l PrintBoldLeftStr
	rts
