DrawStandingsRow:					; draws row a3 of the NHL Standings list: a team and its stat
	lda.w #$000A
	sta.b $CF
	lda.b a3
	inc a
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	lda.w #$0028
	sta.b $CF
	lda.b a3
	asl a
	tax
	lda.w ListBuf,x
	tax
	lda.w $000C,x
	phx
	pha
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldLeft
	pla
	cmp.w #$000D
	bne .1
	ldx.w #$469F
	bra .2
.1:									; if A is not $000E go to .3, X = $46A6
	cmp.w #$000E
	bne .3
	ldx.w #$46A6
.2:									; $CF = $006E, Y = a2+2, call PrintBoldLeft
	lda.w #$006E
	sta.b $CF
	ldy.b a2+2
	jsl.l PrintBoldLeft
.3:									; pull Y, $D1 = $00E8, A = d0, A * 2, ...
	ply
	lda.w #$00E8
	sta.b $D1
	lda.b d0
	asl a
	tax
	jsr (StandingsColumnTexts,x)
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldRightStr
	rts
