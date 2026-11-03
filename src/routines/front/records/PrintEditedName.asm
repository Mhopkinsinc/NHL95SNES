PrintEditedName:					; prints the name being edited (mesarea) on row $65 + 6 in the fixed-width
									; bold font (width 10), the row cleared first
	lda.b a0+2
	xba
	lsr a
	lsr a
	adc.b $D3
	adc.w #$0188
	ldy.w #$0020
	jsl.l ClearRAM7E
	lda.w #$0020
	sta.b $CF
	lda.b a0+2
	clc
	adc.w #$0006
	tay
	ldx.w #mesarea
	lda.w #$000A
	jsl.l PrintBoldFixedLeftStr
	rts
