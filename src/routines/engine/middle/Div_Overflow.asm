Div_Overflow:						; quotient $7FFF
	rep #$20
	lda.w #$7FFF
	sta.b r0
	rtl
	sep #$20
Div32U_ByteDivisor:					; entry used by the routines after it
	lda.b r2+2
	beq Div16x8U_Go
	cmp.b r1
	bcs Div_Overflow
	lda.b r2+1
	sta.l WRDIVL
	lda.b r2+2
	sta.l WRDIVH
	lda.b r1
	sta.l WRDIVB
	phx
	plx
	xba
	lda.l RDDIVL
	sta.b r0+1
	lda.l RDMPYL
	sta.b r2+1
	lda.b r2
	sta.l WRDIVL
	lda.b r2+1
	sta.l WRDIVH
	lda.b r1
	sta.l WRDIVB
	phx
	plx
	xba
	lda.l RDDIVL
	sta.b r0
	rep #$20
	rtl
