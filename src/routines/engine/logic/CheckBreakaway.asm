CheckBreakaway:						; from StartBreakaway, PenShotChk and other segments
	stz.w IsBreakaway
	lda.w puckc
	bpl .1
	jmp.w .rtl
.1:									; A = gmode, if a $0002 bit set go to .2, ...
	lda.w gmode
	bit.w #$0002
	bne .2
	lda.w puckc
	cmp.w #$000C
	bmi .6
	bra .3
.2:									; if puckc - $000C < 0 go to .3, go to .6
	lda.w puckc
	cmp.w #$000C
	bmi .3
	bra .6
.3:									; Y = puckc, if Ypos,y >= 0 go to .rtl, A - $0004, d0 = A, ...
	ldy.w puckc
	lda.w Ypos,y
	bpl .rtl
	sec
	sbc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bpl .4
	ldy.w #$000C
.4:									; d2 = $0006
	lda.w #$0006
	sta.b d2
.loop:								; loop: if position,y < 0 go to .5, if zero go to .5, A = d0, ...
	lda.w position,y
	bmi .5
	beq .5
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl .rtl
.5:									; Y + 1, Y + 1, d2 - 1, if the result >= 0 go to .loop, ...
	iny
	iny
	dec.b d2
	bpl .loop
	bra .9
.6:									; Y = puckc, if Ypos,y < 0 go to .rtl, A + $0004, d0 = A, ...
	ldy.w puckc
	lda.w Ypos,y
	bmi .rtl
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bpl .7
	ldy.w #$000C
.7:									; d2 = $0006
	lda.w #$0006
	sta.b d2
.loop2:								; loop: if position,y < 0 go to .8, if zero go to .8, A = d0, ...
	lda.w position,y
	bmi .8
	beq .8
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi .rtl
.8:									; Y + 1, Y + 1, d2 - 1, if the result >= 0 go to .loop2
	iny
	iny
	dec.b d2
	bpl .loop2
.9:									; IsBreakaway = 0, IsBreakaway + 1
	stz.w IsBreakaway
	inc.w IsBreakaway
.rtl:								; return
	rtl
