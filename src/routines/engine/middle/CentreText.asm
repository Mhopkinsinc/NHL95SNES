CentreText:							; A = the pixel column that centres the text at X between the left and
									; right margins
	jsl.l TextWidth
	lsr.b $0A
	lda.b $D1
	sec
	sbc.b $CF
	lsr a
	sec
	sbc.b $0A
	clc
	adc.b $CF
	rtl
