DrawOtherScoreRow:					; draws row a3 of ShowOtherScores' scrolling list: a game and its score
	lda.w #$0010
	sta.b $CF
	lda.w #$00C4
	sta.b $D1
	lda.b a3
	sta.b r2
	lda.w #$0003
	sta.b r1
	jsl.l Div16x8U
	tay
	ldx.w #$0000
.loop:								; loop: if $7F8EF8,x is not 0 go to .1, if Y = $0000 go to .2, Y - 1
	lda.l $7F8EF8,x
	bne .1
	cpy.w #$0000
	beq .2
	dey
.1:									; A = X, A + $010A, X = A, go to .loop
	txa
	clc
	adc.w #$010A
	tax
	bra .loop
.2:									; if RDMPYL = 0 go to .3, A - 1, if the result = 0 go to .4, return
	lda.l RDMPYL
	beq .3
	dec a
	beq .4
	rts
.3:									; push X, A = $7F8EFA,x, A * 2, X = A, ...
	phx
	lda.l $7F8EFA,x
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldLeft
	plx
	lda.l $7F8F00,x
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldRightStr
	rts
.4:									; push X, A = $7F8EFC,x, A * 2, X = A, ...
	phx
	lda.l $7F8EFC,x
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldLeft
	lda.b $01,s
	tax
	lda.l $7F8F02,x
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldRightStr
	lda.w #$00C8
	sta.b $CF
	plx
	ldy.b a2+2
	lda.l $7F8EFE,x
	bmi .5
	asl a
	tax
	lda.l PerLabels,x
	tax
	jsl.l PrintBoldLeft
	rts
.5:									; X = TxtFinal&$FFFF, call PrintBoldLeft, return
	ldx.w #TxtFinal&$FFFF
	jsl.l PrintBoldLeft
	rts
