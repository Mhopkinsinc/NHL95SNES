ApproxLength:						; called from other segments
	cmp.w #$0000
	bpl .1
	eor.w #$FFFF
	inc a
.1:									; tmp0 = A, A = Y, if the result >= 0 go to .2, A xor $FFFF, ...
	sta.b tmp0
	tya
	bpl .2
	eor.w #$FFFF
	inc a
.2:									; if A >= tmp0 go to .3, A / 2, A + tmp0, return
	cmp.b tmp0
	bcs .3
	lsr a
	clc
	adc.b tmp0
	rtl
.3:									; tmp0 / 2, A + tmp0, return
	lsr.b tmp0
	clc
	adc.b tmp0
	rtl
