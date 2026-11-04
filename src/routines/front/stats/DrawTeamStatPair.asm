DrawTeamStatPair:					; formats two team stats separated by the pair separator
	ldx.b a0+2
	lda.l $C30003,x
	clc
	adc.b a2
	sta.b tmp0
	lda.b (tmp0)
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003E
	sta.w mesarea,x
	inx
	txy
	ldx.b a0+2
	lda.l $C30005,x
	clc
	adc.b a2
	sta.b tmp0
	lda.b (tmp0)
	tax
	lda.l BCDTable,x
	and.w #$00FF
	tyx
	jsr.w BCDTextAt
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
