CentreNameX:						; r0 = the string pointer, A = (20 - its length) / 2 with carry clear: the
									; column that centres it in the 20-wide box
	sta.b r0
	stx.b r0+2
	lda.b [r0]
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0014
	lsr a
	clc
	rts
