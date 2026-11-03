randomd0s:							; called from other segments
	sta.b r3
	asl a
	jsl.l randomd0A
	sec
	sbc.b r3
	clc
	rtl
