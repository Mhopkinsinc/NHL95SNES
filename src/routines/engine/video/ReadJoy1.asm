ReadJoy1:							; called from other segments
	lda.b PadRaw1
	sta.b d3
	lda.w padchange
	sta.b d2
	lda.w padnew1
	sta.b d1
	lda.w paddir
	sta.b d0
	rtl
