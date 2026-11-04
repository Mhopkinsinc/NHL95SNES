goalieacc:							; called from other segments
	lda.w #SPAgready&$FFFF
	sta.b d1
	lda.b d0
	and.w #$000F
	sta.b d0
	cmp.w #$0008
	bcc .3
	ldy.w playerpad,x
	bpl .1
	cmp.w #$0009
	bne .2
.1:									; A = Xvel,x, if the result is not 0 go to .6
	lda.w Xvel,x
	ora.w Yvel,x
	bne .6
.2:									; if pf2aip,x is not 0 go to .rtl, go to SetSPA
	lda.w pf2aip,x
	bne .rtl
	jml.l SetSPA
.rtl:								; return
	rtl
.3:									; if X = puckc go to .7, if asscur,x = $000C go to .7, A = Ypos,x, ...
	cpx.w puckc
	beq .7
	lda.w asscur,x
	cmp.w #$000C
	beq .7
	lda.w Ypos,x
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:									; if A < $009C go to .7, if playerpad,x < 0 go to .5, ...
	cmp.w #$009C
	bcc .7
	ldy.w playerpad,x
	bmi .5
	lda.w SPA,x
	cmp.w #SPAgdive&$FFFF
	bcc .5
	cmp.w #SPAinjury1&$FFFF
	bcc .6
.5:									; if d0 = facedir,x go to .8, d2 = A, A = SPAgready&$FFFF, ...
	lda.b d0
	cmp.w facedir,x
	beq .8
	sta.b d2
	lda.w #SPAgready&$FFFF
	jsl.l SetSPAFromA
	jmp.w .13
.6:									; go to stopna
	jmp.w stopna
.7:									; if goalieturnwait,x is not 0 go to .8, A = d0, A - facedir,x, ...
	lda.w goalieturnwait,x
	bne .8
	lda.b d0
	sec
	sbc.w facedir,x
	sta.b d0
	beq .8
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	clc
	adc.w facedir,x
	and.w #$0007
	sta.b d0
	sta.w facedir,x
	lda.w #$0006
	sta.w goalieturnwait,x
.8:									; if goalieturnwait,x = 0 go to .10, A - timestep, ...
	lda.w goalieturnwait,x
	beq .10
	sec
	sbc.w timestep
	bpl .9
	lda.w #$0000
.9:									; goalieturnwait,x = A
	sta.w goalieturnwait,x
.10:								; A = goalieflags,x, if a $0002 bit set go to .11, ...
	lda.w goalieflags,x
	bit.w #$0002
	bne .11
	lda.w #SPAgready&$FFFF
	bra .12
.11:								; A = SPAgskate&$FFFF
	lda.w #SPAgskate&$FFFF
.12:								; call SetSPAFromA, d2 = facedir,x
	jsl.l SetSPAFromA
	lda.w facedir,x
	sta.b d2
.13:								; if playerpad,x < 0 go to .14, A = legspd,x, push A, A / 2, ...
	lda.w playerpad,x
	bmi .14
	lda.w legspd,x
	pha
	lsr a
	sta.b tmp0
	lsr a
	lsr a
	sta.b tmp1
	sec
	lda.b tmp0
	sbc.b tmp1
	sta.w legspd,x
	phx
	jsl.l playeracc
	plx
	pla
	sta.w legspd,x
	rtl
.14:								; go to playeracc
	jml.l playeracc
