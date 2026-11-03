DrawTeamStatPercent:				; formats the ratio of two team stats as a percentage capped at 100
	ldx.b a0+2
	lda.l $C30005,x
	clc
	adc.b a2
	sta.b tmp0
	lda.b (tmp0)
	beq .2
	sta.b d1
	lda.l $C30003,x
	clc
	adc.b a2
	sta.b tmp0
	lda.b (tmp0)
	cmp.b d1
	bcc .1
	lda.w #$0100
	bra .2
.1:									; X = $0064, call Mul8U, X = A, A = d1, ...
	ldx.w #$0064
	jsl.l Mul8U
	tax
	lda.b d1
	jsl.l DivX8U
	tax
	lda.l BCDTable,x
	and.w #$00FF
.2:									; call BCDText, mesarea,x = $003C, Y = a2+2, X = mesarea, ...
	jsr.w BCDText
	lda.w #$003C
	sta.w mesarea,x
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
