PushTime:							; a1 = the time d0 (seconds) as a minutes:seconds string (in a work
									; buffer, length byte first)
	lda.w #$0020
	jsl.l AllocWorkBuf2
	clc
	adc.w #$001F
	sta.b a1
	pha
	lda.b d0
	sta.b r2
	lda.w #$000A
	sta.b r1
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.l RDMPYL
	clc
	adc.b #$B0
	sta.b (a1)
	rep #$30
	lda.b r0
	sta.b r2
	lda.w #$0006
	sta.b r1
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.l RDMPYL
	clc
	adc.b #$B0
	sta.b (a1)
	rep #$20
	dec.b a1
	sep #$20
	lda.b #$BA
	sta.b (a1)
	rep #$30
	lda.b r0
	sta.b r2
	lda.w #$000A
	sta.b r1
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.l RDMPYL
	clc
	adc.b #$B0
	sta.b (a1)
	rep #$31
	lda.b r0
	beq .1
	dec.b a1
	sep #$20
	adc.b #$B0
	sta.b (a1)
	rep #$30
.1:									; a1 - 1, pull A, A - a1, A 8-bit, ...
	dec.b a1
	pla
	clc
	sbc.b a1
	sep #$20
	sta.b (a1)
	rep #$20
	rtl
