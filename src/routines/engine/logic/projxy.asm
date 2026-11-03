projxy:								; project rink coordinates and height into screen coordinates
	lda.b d0
	sec
	sbc.b Hpos
	sta.b d0
	lda.b d1
	sec
	sbc.b Vpos
	sta.b d1
	lda.b d0
	clc
	adc.w #$0080
	sta.b d0
	lda.b d2
	asl a
	clc
	adc.b d2
	pha
	asl a
	pla
	ror a
	clc
	adc.b d1
	sta.b d1
	lda.w #$005E
	sec
	sbc.b d1
	sta.b d1
	rtl
.1:									; unreached: 94S projxy's off-screen exit .t1x (d1 = $4E20); 95 projxy has
									; no range checks that branch here
	lda.w #$4E20
	sta.b d1
	rtl
