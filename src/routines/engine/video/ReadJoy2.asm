ReadJoy2:							; read pad two into d0 through d3
	lda.b PadRaw2
	sta.b d3
	lda.w padchange+2
	sta.b d2
	lda.w padnew+2
	sta.b d1
	lda.w paddir+2
	sta.b d0
	rtl
