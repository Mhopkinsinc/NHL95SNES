DrawPlayerStatRow:					; draws row a3 of PlayerStatsScreen' scrolling list: a player and his
									; stats
	lda.w #$0010
	sta.b $CF
	lda.b a3
	asl a
	tay
	lda.w ScratchBuf,y
	sta.b a0+2
	lda.w #HomeRoster
	ldx.b a2
	beq .1
	lda.w #VisRoster
.1:									; push A, A = a0+2, A * 2, A * 2, ...
	pha
	lda.b a0+2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $01,s
	adc.w #$0118
	plx
	tax
	lda.w #$000E
	jsr.w FitNameToMesarea
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.b a2
	beq .2
	lda.b a0+2
	clc
	adc.w #$001A
	sta.b a0+2
.2:									; $CF = $0078, $D1 = $0090, X = a0+2, A = tmgoals,x, ...
	lda.w #$0078
	sta.b $CF
	lda.w #$0090
	sta.b $D1
	ldx.b a0+2
	lda.w tmgoals,x
	and.w #$00FF
	ldx.w #$0000
	jsr.w PrintStatCell
	lda.w #$00A8
	sta.b $D1
	ldx.b a0+2
	lda.b $7D
	cmp.w #$FFFF
	beq PrintGoalieShotsPct
	lda.w tmassists,x
	and.w #$00FF
	ldx.w #$0002
	jsr.w PrintStatCell
	lda.w #$00C0
	sta.b $D1
	ldx.b a0+2
	lda.w tmgoals,x
	and.w #$00FF
	pha
	lda.w tmassists,x
	and.w #$00FF
	clc
	adc.b $01,s
	ply
	ldx.w #$0004
	jsr.w PrintStatCell
	lda.w #$00D8
	sta.b $D1
	ldx.b a0+2
	lda.w tmpshots,x
	and.w #$00FF
	ldx.w #$0006
	jsr.w PrintStatCell
	lda.w #$00F0
	sta.b $D1
	ldx.b a0+2
	lda.w ppenmin,x
	and.w #$00FF
	ldx.w #$0008
PrintStatCell:						; prints value A (100 as 100) centred on row $6D, highlighted when X is
									; the sort column $7D; $CF to the next column
	cpx.b $7D
	bne .1
	ldx.w #$2400
	stx.b $D5
.1:									; if A is not $0064 go to .2, A = $0100, go to .3
	cmp.w #$0064
	bne .2
	lda.w #$0100
	bra .3
.2:									; X = A, A = BCDTable,x, A and $00FF
	tax
	lda.l BCDTable,x
	and.w #$00FF
.3:									; call BCDText, Y = a2+2, X = mesarea, call PrintBoldCentredStr, ...
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	lda.w #$2000
	sta.b $D5
	lda.b $D1
	sta.b $CF
	rts
