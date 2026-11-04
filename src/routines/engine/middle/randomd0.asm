randomd0:							; replace d0 with a random number below its current value
	lda.b d0
	jsl.l randomd0A
	sta.b d0
	rtl
