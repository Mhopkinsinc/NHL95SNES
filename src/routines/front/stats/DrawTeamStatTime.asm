DrawTeamStatTime:					; formats a team stat time as centred minutes and seconds
	ldx.b a0+2
	lda.l $C30003,x
	clc
	adc.b a2
	sta.b tmp0
	lda.b (tmp0)
	jsr.w TimeTextMSS
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
