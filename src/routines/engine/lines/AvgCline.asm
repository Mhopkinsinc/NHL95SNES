AvgCline:							; from chk4lc and other segments
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($63)
	pei ($65)
	stz.b d0
	stz.b d1
	lda.w #$0005
	sta.b d2
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
.loop:								; loop: Y = a0, if position,y = 0 go to .2, if minus go to .2, ...
	ldy.b a0
	lda.w position,y
	beq .2
	bmi .2
	lda.w pnum,y
	and.w #$00FF
	asl a
	sta.b d3
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d3, Y = A, A = tmpde,y, A + d0, ...
	adc.b d3
	tay
	lda.w tmpde,y
	adc.b d0
	sta.b d0
	inc.b d1
.2:									; a0 + 1, a0 + 1, d2 - 1, if the result >= 0 go to .loop, ...
	inc.b a0
	inc.b a0
	dec.b d2
	bpl .loop
	lda.b d1
	beq .3
	sta.b r1
	phx
	lda.b d0
	sta.b r2
	jsl.l Div16U
	lda.b r0
	sta.b d0
	plx
.3:									; pull A, a0+2 = A, pull A, a0 = A, ...
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	rtl
