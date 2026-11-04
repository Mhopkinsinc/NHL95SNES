getpde:								; from makepde and other segments
	lda.w pnum,x
	and.w #$00FF
	asl a
	sta.b d1
	lda.w pfteam,x
	beq .1
	lda.w #$0002
.1:									; a2 = A, if zero go to .2, A = $0034
	sta.b a2
	beq .2
	lda.w #$0034
.2:									; A + d1, Y = A, d0 = tmpde,y, return
	adc.b d1
	tay
	lda.w tmpde,y
	sta.b d0
	rtl
