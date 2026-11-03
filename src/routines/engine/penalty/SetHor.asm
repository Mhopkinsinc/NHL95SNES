SetHor:								; what is left of 94S SetHor: halves the puck speed and counts sfhormode
									; up; X = a3
	lda.w puckvx
	pha
	asl a
	pla
	ror a
	sta.w puckvx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	inc.w sfhormode
	ldx.b a3
	rtl
