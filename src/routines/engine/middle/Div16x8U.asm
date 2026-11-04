Div16x8U:							; r2 / r1 (8 bits) into r0 with the hardware divider; $7FFF when r1 is 0
	sep #$20
Div16x8U_Go:						; entry used by the routines after it
	lda.b r2+1
	sta.l WRDIVH
	xba
	lda.b r2
	sta.l WRDIVL
	tax
	lda.b r1
	beq Div_Overflow
	sta.l WRDIVB
	rep #$20
	phx
	plx
	lda.l RDDIVL
	sta.b r0
	rtl
