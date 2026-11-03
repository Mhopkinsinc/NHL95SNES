randoma8:							; called from other segments
	phx
	pha
randoma8_go:						; scale a random byte by the limit already on the stack
	jsl.l RandomWord
	and.w #$00FF
	plx
	jsl.l Mul8U
	and.w #$FF00
	xba
	clc
	plx
	rtl
