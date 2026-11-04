pplpen:								; from DispPen and other segments
	lda.w printy
	cmp.w #$000B
	bcs USBoard_rtl
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, A = tmpdst,y, A and $07FF, ...
	adc.b d0
	tay
	lda.w tmpdst,y
	and.w #$07FF
	sta.b d2
	lda.w #$00C3
	sta.b a1+2
	ldy.b a2
	lda.w tmdata,y
	sta.b a1
	lda.b [a1]
	and.w #$07FF
	clc
	adc.b d0
	sta.b a1
	lda.b [a1]
	and.w #$3FFF
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	sta.b d0
	rtl
