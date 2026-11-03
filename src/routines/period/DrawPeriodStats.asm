DrawPeriodStats:					; the period stats: the periods played and Total, the heading Goals or
									; Shots with the B hint, then each team's goals or shots per period and
									; their sum
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w #$0000
	ldy.w #$0013
.loop:								; loop: push A, push Y, A * 2, X = A, ...
	pha
	phy
	asl a
	tax
	lda.l PerLabels,x
	tax
	jsl.l PrintBoldCentred
	ply
	iny
	pla
	cmp.w lastperiod
	beq .1
	inc a
	bra .loop
.1:									; X = TxtTotal&$FFFF, Y = $0018, call PrintBoldCentred, a1 = $4EEF, ...
	ldx.w #TxtTotal&$FFFF
	ldy.w #$0018
	jsl.l PrintBoldCentred
	lda.w #$4EEF
	sta.b a1
	ldy.w #$129B
	ldx.w #$4B6A
	lda.b $7B
	beq .2
	ldy.w #$1287
	ldx.w #TxtShots&$FFFF
	lda.w #TxtBGoals&$FFFF
	sta.b a1
.2:									; a0 = Y, Y = $000F, call PrintItalicCentred, Y = $0011, ...
	sty.b a0
	ldy.w #$000F
	jsl.l PrintItalicCentred
	ldy.w #$0011
	jsl.l PrintTitleBar
	ldx.b a1
	ldy.w #$001A
	jsl.l PrintBoldLeft
	lda.w #$0090
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	jsr.w PrintPeriodRow
	lda.w #$0010
	sta.b $CF
	lda.w #$0070
	sta.b $D1
	inc.b a0
	inc.b a0
	jmp.w PrintPeriodRow
