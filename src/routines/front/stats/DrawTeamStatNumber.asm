DrawTeamStatNumber:					; formats a team stat as a centred decimal value
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
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
