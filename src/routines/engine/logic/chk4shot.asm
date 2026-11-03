chk4shot:							; called from other segments
	lda.w gmclock
	bne .1
	lda.w gameclock
	cmp.w #$0005
	bcs .1
	jmp.w CompShoot
.1:									; if PenShotActive is not 0 go to .2, call chkpk, ...
	lda.w PenShotActive
	bne .2
	jsl.l chkpk
	bne .2
	lda.w threat
	beq .2
	lda.w Ypos,x
	cmp.w #$FF0D
	bmi .2
	cmp.w #$00F3
	bpl .2
	lda.w seed
	and.w #$0003
	bne .2
	jmp.w AssignDumpIn
.2:									; A = $0020, A - spodds,x, A * 2, A * 2, ...
	lda.w #$0020
	sec
	sbc.w spodds,x
	asl a
	asl a
	asl a
	asl a
	sta.b d4
	ldy.w #$010E
	lda.w pfgoal,x
	bne .3
	ldy.w #$FEF2
.3:									; d1 = Y, A = Y, A - pucky, d1 = A, ...
	sty.b d1
	tya
	sec
	sbc.w pucky
	sta.b d1
	cmp.w #$0064
	bpl .5
	cmp.w #$FF9C
	bmi .5
	lda.w puckx
	cmp.w #$0064
	bpl .5
	cmp.w #$FF9C
	bmi .8
	eor.w #$FFFF
	inc a
	and.w #$00FF
	asl a
	tax
	lda.l SignedSquareTable,x
	tay
	lda.b d1
	and.w #$00FF
	asl a
	tax
	tya
	adc.l SignedSquareTable,x
	sta.b tmp0
	ldx.b curobj
	cmp.w #$2711
	lsr.b d4
	lsr.b d4
	lsr.b d4
	lsr.b d4
	jsl.l vtoa
	sta.b d5
	lda.w #$0005
	sta.b d3
	ldy.w #$0000
	cpx.w #$000C
	bcs .4
	ldy.w #$000C
.4:									; if position,y = 0 go to .6, A = puckdir,y, A - $0004, A and $0007, ...
	lda.w position,y
	beq .6
	lda.w puckdir,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.b d5
	bne .7
	asl.b d4
	bra .7
.5:									; go to .8
	bra .8
.6:									; if pf2aip,y = 0 go to .7, d3 = 0, d4 = $0001
	lda.w pf2aip,y
	beq .7
	stz.b d3
	lda.w #$0001
	sta.b d4
.7:									; Y + 1, Y + 1, d3 - 1, if the result >= 0 go to .4
	iny
	iny
	dec.b d3
	bpl .4
.8:									; A = d4, call randomd0A, if A >= $0009 go to .rtl, d0 = pucky, ...
	lda.b d4
	jsl.l randomd0A
	cmp.w #$0009
	bcs .rtl
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .9
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.9:									; if d0 < 0 go to .rtl, A = $010E, A - d0, ...
	lda.b d0
	bmi .rtl
	lda.w #$010E
	sec
	sbc.b d0
	bmi .rtl
	lda.w PenShotActive
	beq .10
	lda.w #$00B2
	lsr a
	lsr a
	clc
	adc.w #$005C
	sec
	sbc.b d0
	bpl .rtl
.10:								; A = sflags, if a $8000 bit set go to .rtl, go to CompShoot
	lda.w sflags
	bit.w #$8000
	bne .rtl
	jmp.w CompShoot
.rtl:								; return
	rtl
