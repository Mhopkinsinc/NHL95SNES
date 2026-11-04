setpde:								; called from other segments
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d1, Y = A, if d0 >= 0 go to .2, d0 = $0000
	clc
	adc.b d1
	tay
	lda.b d0
	bpl .2
	lda.w #$0000
	sta.b d0
.2:									; tmpde,y = A, return
	sta.w tmpde,y
	rtl
