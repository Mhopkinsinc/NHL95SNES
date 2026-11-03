PrintPlayerStatHeads:				; prints the player stats headings (the sort column's name from
									; StatColumnNames, the column titles, the sort column highlighted); with
									; $7D $FFFF the goalie ones (PrintGoalieStatHeads)
	lda.w #$0010
	sta.b $CF
	lda.w #$0078
	sta.b $D1
	lda.w #$0200
	clc
	adc.b $D3
	ldy.w #$0020
	jsl.l ClearRAM7E
	lda.w #$0240
	clc
	adc.b $D3
	ldy.w #$0020
	jsl.l ClearRAM7E
	ldy.w #$000B
	sty.b a2+2
	ldx.b $7D
	cpx.w #$FFFF
	bne .1
	jmp.w PrintGoalieStatHeads
.1:									; A = StatColumnNames,x, X = A, Y = $0008, call PrintItalicLeft, ...
	lda.l StatColumnNames,x
	tax
	ldy.w #$0008
	jsl.l PrintItalicLeft
	lda.w #$0020
	sta.b $CF
	ldx.w #TxtBGoalies&$FFFF
	ldy.w #$0019
	jsl.l PrintBoldLeft
	lda.w #$0010
	sta.b $CF
	ldx.w #TxtPlayer&$FFFF
	lda.w #$8000
	jsr.w PrintStatHead
	lda.w #$0090
	sta.b $D1
	ldx.w #TxtG&$FFFF
	lda.w #$0000
	jsr.w PrintStatHead
	lda.w #$00A8
	sta.b $D1
	ldx.w #TxtA&$FFFF
	lda.w #$0002
	jsr.w PrintStatHead
	lda.w #$00C0
	sta.b $D1
	ldx.w #TxtPt&$FFFF
	lda.w #$0004
	jsr.w PrintStatHead
	lda.w #$00D8
	sta.b $D1
	ldx.w #TxtSh&$FFFF
	lda.w #$0006
	jsr.w PrintStatHead
	lda.w #$00F0
	sta.b $D1
	ldx.w #$4F7B
	lda.w #$0008
PrintStatHead:						; prints column title X centred on row $6D, highlighted ($2400) when A is
									; the sort column $7D; $CF to the next column
	cmp.b $7D
	bne .1
	lda.w #$2400
	sta.b $D5
.1:									; Y = a2+2, call PrintBoldCentred, $D5 = $2000, $CF = $D1, ...
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.w #$2000
	sta.b $D5
	lda.b $D1
	sta.b $CF
	rts
