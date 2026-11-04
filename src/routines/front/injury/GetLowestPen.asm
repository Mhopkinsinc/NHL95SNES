GetLowestPen:						; from updatepwrplay and other segments
	stz.b d0
	stz.b d3
	lda.b a2
	beq .1
	lda.w #$001A
.1:									; a0 = A
	sta.b a0
.loop:								; loop: Y = a0, a0 + 1, A = tmboxlist,y, A and $00FF, ...
	ldy.b a0
	inc.b a0
	lda.w tmboxlist,y
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne .3
	lda.b a2
	beq .2
	lda.w #$0034
.2:									; A + d2, Y = A, d2 = tmpdst,y, if a $4000 bit set go to .loop, ...
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	sta.b d2
	bit.w #$4000
	bne .loop
	lda.b d2
	sec
	sbc.b d3
	sta.b d2
	clc
	adc.b d0
	sta.b d0
	lda.b d2
	sta.b d3
	bra .loop
.3:									; Y = a3, if tmap,y = $0006 go to .rtl, A = d0, A - d3, ...
	ldy.b a3
	lda.w tmap,y
	cmp.w #$0006
	beq .rtl
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
	lda.b a3
	beq .4
	lda.w #$001A
.4:									; a0 = A
	sta.b a0
.loop2:								; loop: Y = a0, A = tmboxlist,y, a0 + 1, A and $00FF, ...
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne .rtl
	lda.b a3
	beq .5
	lda.w #$0034
.5:									; A + d2, Y = A, A = tmpdst,y, if a $4000 bit set go to .loop2, ...
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop2
	lda.b d0
	cmp.w tmpdst,y
	bmi .rtl
	lda.b d0
	clc
	adc.b d3
	sta.b d0
.rtl:								; return
	rtl
