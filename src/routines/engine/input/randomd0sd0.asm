randomd0sd0:						; called from other segments
	lda.b d0
	asl a
	jsl.l randomd0A
	sec
	sbc.b d0
	sta.b d0
	clc
	rtl
