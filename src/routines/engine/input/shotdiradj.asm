shotdiradj:							; from doshot and other segments
	lda.w playerpad,x
	bmi .1
	jmp.w .rtl
.1:									; d0 = $0008, d1 = $0005, Y = $0000, if pfteam,x is not 0 go to .loop, ...
	lda.w #$0008
	sta.b d0
	lda.w #$0005
	sta.b d1
	ldy.w #$0000
	lda.w pfteam,x
	bne .loop
	ldy.w #$000C
.loop:								; loop: if position,y = 0 go to .2, Y + 1, Y + 1, d1 - 1, ...
	lda.w position,y
	beq .2
	iny
	iny
	dec.b d1
	bpl .loop
	jmp.w .7
.2:									; A = Xvel+1,y, A and $00FF, if $0080 bits clear go to .3, A or $FF00
	lda.w Xvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; push A, A * 2, pull A, A + Xpos,y, ...
	pha
	asl a
	pla
	ror a
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	sta.b d0
	lda.w Yvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:									; push A, A * 2, pull A, A + Ypos,y, ...
	pha
	asl a
	pla
	ror a
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l ApproxLength
	sta.b d2
	lda.w #$0012
	sta.b d3
	ldy.w #$010E
	lda.w pfgoal,x
	bne .5
	ldy.w #$FEF2
.5:									; d4 = Y, A = Y, push A, call CalcAngleOffset, ...
	sty.b d4
	tya
	pha
	pei ($8B)
	jsr.w CalcAngleOffset
	lda.b d4
	sta.b d5
	pla
	eor.w #$FFFF
	inc a
	sta.b d3
	pla
	sta.b d4
	jsr.w CalcAngleOffset
	lda.b d4
	clc
	adc.b d5
	sta.b d4
	ldx.b a3
	stz.b d0
	lda.b d4
	cmp.w #$FFD3
	bmi .7
	cmp.w #$002D
	bpl .7
	lda.w pfgoal,x
	beq .6
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
.6:									; call RandomWord, A and $0003, A + 1, d0 = A, ...
	jsl.l RandomWord
	and.w #$0003
	inc a
	sta.b d0
	lda.b d4
	bpl .7
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
.7:									; passdir = d0
	lda.b d0
	sta.w passdir
.rtl:								; return
	rtl
