NoGameSelected:						; the warning A game must be selected. / Okay (screen state 12)
	lda.b $D3
	clc
	adc.w #$0180
	ldy.w #$0580
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$2C00
	sta.b $D5
	lda.w #$0032
	sta.b $CF
	ldx.w #TxtAGameMustBe&$FFFF
	ldy.w #$0008
	jsl.l PrintItalicLeft
	ldy.w #$000A
	ldx.w #TxtSelected&$FFFF
	jsl.l PrintItalicLeft
	lda.w #$2000
	sta.b $D5
	lda.w #$006E
	sta.b $CF
	ldy.w #$000E
	ldx.w #TxtOkay&$FFFF
	jsl.l PrintItalicLeft
	jsl.l SendTextMap
	ldx.b a0
	lda.w #$0064
	sta.b $05,x
	lda.w #$007E
	sta.b $08,x
	lda.w #$000C
	sta.b d6+2
	rts
