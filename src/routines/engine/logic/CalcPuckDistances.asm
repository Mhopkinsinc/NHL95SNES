CalcPuckDistances:					; update every object distance and direction to the puck
	ldx.w #$0000
.loop:								; loop: A = puckx, A - Xpos,x, d0 = A, if plus go to .1, ...
	sec
	lda.w puckx
	sbc.w Xpos,x
	sta.b d0
	bpl .1
	eor.w #$FFFF
	inc a
	sec
.1:									; r3 = A, A = pucky, A - Ypos,x, d1 = A, ...
	sta.b r3
	lda.w pucky
	sbc.w Ypos,x
	sta.b d1
	bpl .2
	eor.w #$FFFF
	inc a
.2:									; if A < r3 go to .3, r3 / 2, A * 2
	cmp.b r3
	bcc .3
	lsr.b r3
	asl a
.3:									; A / 2, A + r3, puckdist,x = A, call vtoa, ...
	lsr a
	adc.b r3
	sta.w puckdist,x
	jsl.l vtoa
	sta.w puckdir,x
	inx
	inx
	cpx.w #$0020
	bcc .loop
	rtl
