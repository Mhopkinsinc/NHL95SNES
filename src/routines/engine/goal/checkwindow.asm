checkwindow:						; called from other segments
	lda.w yc1
	sta.b d2
	lda.w xc1
	sta.b d3
	lda.w sflags
	bit.w #$0040
	bne .4
	ldx.w #$001C
	lda.w puckc
	bmi .2
	tax
	lda.w pfgoal,x
	beq .1
	lda.w yleader
	adc.w impactstep
	sta.w yleader
	cmp.w #$0020
	bmi .2
	lda.w #$0020
	sta.w yleader
	bra .2
.1:									; A = yleader, A - impactstep, yleader = A, ...
	lda.w yleader
	sec
	sbc.w impactstep
	sta.w yleader
	cmp.w #$FFE1
	bpl .2
	lda.w #$FFE0
	sta.w yleader
.2:									; A = Yvel,x, A / 2, A / 2, A / 2, ...
	lda.w Yvel,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0100
	beq .3
	ora.w #$FE00
.3:									; A + Ypos,x, A + yleader, d2 = A, yc1 = A, ...
	clc
	adc.w Ypos,x
	clc
	adc.w yleader
	sta.b d2
	sta.w yc1
	lda.w Xpos,x
	sta.b d3
	sta.w xc1
.4:									; A = d2, A - Vpos, d0 = A, if A - $FFF7 >= 0 go to .5, ...
	lda.b d2
	sec
	sbc.b Vpos
	sta.b d0
	cmp.w #$FFF7
	bpl .5
	lda.b d2
	sec
	sbc.w #$FFF6
	sta.b d1
	cmp.w #$FF39
	bpl .6
	lda.w #$FF39
	sta.b d1
	bra .6
.5:									; if d0 - $000B < 0 go to .9, A = d2, A - $000A, d1 = A, ...
	lda.b d0
	cmp.w #$000B
	bmi .9
	lda.b d2
	sec
	sbc.w #$000A
	sta.b d1
	cmp.w #$0100
	bmi .6
	lda.w #$0100
	sta.b d1
.6:									; A = d1, A - Vpos, if the result = 0 go to .9, A / 2, ...
	lda.b d1
	sec
	sbc.b Vpos
	beq .9
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .7
	ora.w #$F000
.7:									; if A is not $0000 go to .8, A + 1
	cmp.w #$0000
	bne .8
	inc a
.8:									; A + Vpos, Vpos = A
	clc
	adc.b Vpos
	sta.b Vpos
.9:									; A = d3, A - Hpos, d0 = A, if A - $FFD8 >= 0 go to .10, ...
	lda.b d3
	sec
	sbc.b Hpos
	sta.b d0
	cmp.w #$FFD8
	bpl .10
	lda.b d3
	sec
	sbc.w #$FFD8
	sta.b d1
	cmp.w #$FFC8
	bpl .11
	lda.w #$FFC8
	sta.b d1
	bra .11
.10:								; if d0 - $0029 < 0 go to .rtl, A = d3, A - $0028, d1 = A, ...
	lda.b d0
	cmp.w #$0029
	bmi .rtl
	lda.b d3
	sec
	sbc.w #$0028
	sta.b d1
	cmp.w #$0039
	bmi .11
	lda.w #$0038
	sta.b d1
.11:								; A = d1, A - Hpos, if the result = 0 go to .rtl, A / 2, ...
	lda.b d1
	sec
	sbc.b Hpos
	beq .rtl
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .12
	ora.w #$F000
.12:								; if A is not $0000 go to .13, A + 1
	cmp.w #$0000
	bne .13
	inc a
.13:								; A + Hpos, Hpos = A
	clc
	adc.b Hpos
	sta.b Hpos
.rtl:								; return
	rtl
