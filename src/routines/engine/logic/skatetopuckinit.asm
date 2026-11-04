skatetopuckinit:					; called from other segments
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .1
	ora.w #$FF80
.1:									; A + puckx, d0 = A, A = puckvy, A / 2, ...
	clc
	adc.w puckx
	sta.b d0
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .2
	ora.w #$FF80
.2:									; A + pucky, d1 = A, return
	clc
	adc.w pucky
	sta.b d1
	rtl
