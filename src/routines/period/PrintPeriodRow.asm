PrintPeriodRow:						; prints a stat's value for each period (the words at (a0), 4 bytes apart,
									; to lastperiod) from column $13, then their total at column $18
	stz.b tmp0
	lda.w #$0000
	ldy.w #$0013
.loop:								; loop: push A, push Y, A * 2, A * 2, ...
	pha
	phy
	asl a
	asl a
	tay
	lda.b (a0),y
	adc.b tmp0
	sta.b tmp0
	lda.b (a0),y
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	lda.b $01,s
	tay
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	ply
	iny
	pla
	cmp.w lastperiod
	beq .1
	inc a
	bra .loop
.1:									; Y = $0018, X = tmp0, A = BCDTable,x, A and $00FF, ...
	ldy.w #$0018
	ldx.b tmp0
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
