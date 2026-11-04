DispPen:							; from USBoard and other segments
	lda.b a2
	beq .1
	lda.w #$001A
.1:									; a0 = A
	sta.b a0
.loop:								; loop: Y = a0, A = tmboxlist,y, a0 + 1, A and $00FF, ...
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne .3
	lda.b a2
	beq .2
	lda.w #$0034
.2:									; A + d0, Y = A, A = tmpdst,y, if a $4000 bit set go to .loop, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop
	jsl.l pplpen
	bra .loop
.3:									; if a2 = 0 go to .4, A = $001A
	lda.b a2
	beq .4
	lda.w #$001A
.4:									; a0 = A
	sta.b a0
.loop2:								; loop: Y = a0, A = tmboxlist,y, a0 + 1, A and $00FF, ...
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne USBoard_rtl
	lda.b a2
	beq .5
	lda.w #$0034
.5:									; A + d0, Y = A, A = tmpdst,y, if $4000 bits clear go to .loop2, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	beq .loop2
	jsl.l pplpen
	bra .loop2
