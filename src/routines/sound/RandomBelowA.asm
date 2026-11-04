RandomBelowA:						; A = a random number below A: the next byte of its generator divided by
									; A, the remainder
	sep #$20
	pha
	lda.w RandomState+3
	adc.b #$12
	asl a
	asl a
	asl a
	eor.w RandomState+3
	asl a
	asl a
	rol.w RandomState
	rol.w RandomState+1
	rol.w RandomState+2
	rol.w RandomState+3
	rep #$20
	lda.w RandomState+1
	and.w #$00FF
	sta.l WRDIVL
	sep #$20
	pla
	sta.l WRDIVB
	rep #$20
	pha
	pla
	lda.l RDMPYL
	rtl
