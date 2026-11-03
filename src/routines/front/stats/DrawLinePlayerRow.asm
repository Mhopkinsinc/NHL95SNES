DrawLinePlayerRow:					; draws row a3 of SelectLinePlayer's list: a player and the shown rating,
									; the current row highlighted
	ldx.w #$2000
	lda.b a3
	cmp.b $7B
	bne .1
	ldx.w #$2400
.1:									; $D5 = X, $CF = $0010, $D1 = $00D0, A + a0+2, ...
	stx.b $D5
	ldx.w #$0010
	stx.b $CF
	ldx.w #$00D0
	stx.b $D1
	clc
	adc.b a0+2
	sta.b d0
	asl a
	adc.b a0
	tax
	lda.w $0008,x
	sta.b d0+2
	lda.b d0
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b a0
	adc.w #$0118
	tax
	phx
	lda.l $7DFFF8,x
	and.w #$00FF
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	lda.w #$0022
	sta.b $CF
	plx
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $7D
	asl a
	asl a
	tax
	txy
	lda.l RatingColumns,x
	sta.b d4
	lda.l RatingColumns+2,x
	tax
	pea.w LinePlayerRowDone-1
	jmp (RosterColumnTable,x)
