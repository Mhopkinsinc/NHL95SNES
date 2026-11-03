randomd0A:							; from randomd0, randomd0s, randomd0sd0 and other segments
	phx
	pha
	cmp.w #$0100
	bcc randoma8_go
	jsl.l RandomWord
	plx
	jsl.l Mul16U
	lda.b r2+2
	clc
	plx
	rtl
