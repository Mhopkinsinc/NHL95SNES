chk4pass:							; called from other segments
	lda.w threat
	bne .1
	lda.w #$0010
	clc
	adc.w spodds,x
	jsl.l randoma8
	cmp.w #$0009
	bcs .rtl
.1:									; A = $0006, call randoma8, d0 = A, if X < $000C go to .2, ...
	lda.w #$0006
	jsl.l randoma8
	sta.b d0
	cpx.w #$000C
	bcc .2
	clc
	adc.w #$0006
	sta.b d0
.2:									; if position,x = 0 go to .3, if puckx - $FFD7 < 0 go to .3, ...
	lda.w position,x
	beq .3
	lda.w puckx
	cmp.w #$FFD7
	bmi .3
	cmp.w #$0029
	bpl .3
	lda.w pucky
	cmp.w #$FF2D
	bmi .rtl
	cmp.w #$00D3
	bpl .rtl
.3:									; d0 * 2, if X is not d0 go to .4
	asl.b d0
	cpx.b d0
	bne .4
.rtl:								; return
	rtl
.4:									; a0 = d0, if position,y = 0 go to .rtl, if minus go to .rtl, ...
	ldy.b d0
	sty.b a0
	lda.w position,y
	beq .rtl
	bmi .rtl
	lda.w pflags,y
	and.w #$1000
	ora.w pfalock,y
	bne .rtl
	lda.w Ypos,y
	sta.b d0
	lda.w Ypos,x
	sta.b d1
	lda.w pfgoal,x
	bne .5
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.5:									; A = gmode, if $0020 bits clear go to .6, A = d0, A - $005C, ...
	lda.w gmode
	bit.w #$0020
	beq .6
	lda.b d0
	sec
	sbc.w #$005C
	sta.b tmp0
	lda.b d1
	sec
	sbc.w #$005C
	eor.b tmp0
	bmi .rtl
.6:									; if d0 - $005C >= 0 go to .7, A = d0, A - d1, d0 = A, ...
	lda.b d0
	cmp.w #$005C
	bpl .7
	lda.b d0
	sec
	sbc.b d1
	sta.b d0
	cmp.w #$FFF1
	bmi .rtl2
.7:									; A = puckdir,y, A - $0004, A and $0007, passdir = A, ...
	lda.w puckdir,y
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w puckdist,y
	sta.b d2
	lda.w #$0005
	sta.b d3
	ldy.w #$0000
	stz.b a1
	cpx.w #$000C
	bcs .loop
	ldy.w #$000C
.loop:								; loop: if d2 < puckdist,y go to .8, A = puckdir,y, A - $0004, ...
	lda.b d2
	cmp.w puckdist,y
	bcc .8
	lda.w puckdir,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.w passdir
	beq .rtl2
.8:									; Y + 1, Y + 1, d3 - 1, if the result >= 0 go to .loop, ...
	iny
	iny
	dec.b d3
	bpl .loop
	jsl.l dopass
	lda.w position,x
	beq .rtl2
	pla
	sep #$20
	pla
	rep #$30
	jmp.w assexit
.rtl2:								; return
	rtl
