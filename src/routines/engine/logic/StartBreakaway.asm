StartBreakaway:						; called from other segments
	jsl.l CheckBreakaway
	lda.w IsBreakaway
	sta.w breakaway
	beq .rtl
	lda.w penshot
	bne .1
	lda.w #$0001
	jsl.l StartSound
.1:									; A = CwdExciteLvl, A + $0014, if the result < 0 go to .2, ...
	lda.w CwdExciteLvl
	clc
	adc.w #$0014
	bmi .2
	sta.w CwdExciteLvl
.2:									; push Y, Y = $0000, if puckc - $000C < 0 go to .3, Y = $0002
	phy
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bmi .3
	ldy.w #$0002
.3:									; if penshot is not 0 go to .4, A = tmBreakaways,y, A + 1, ...
	lda.w penshot
	bne .4
	lda.w tmBreakaways,y
	inc a
	sta.w tmBreakaways,y
.4:									; pull Y
	ply
.rtl:								; return
	rtl
