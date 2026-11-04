asscentero:							; called from other segments
	cpx.w puckc
	beq .2
	ldy.w puckc
	bmi .3
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .3
	lda.w #$0005
	sta.b d0
	jmp.w assreplace
.rtl:								; return
	rtl
.1:									; go to donothing
	jmp.w donothing
.2:									; d0 = $0011, go to assinsert
	lda.w #$0011
	sta.b d0
	jmp.w assinsert
.3:									; if gmclock is not 0 go to .1, call check4bench, ...
	lda.w gmclock
	bne .1
	jsl.l check4bench
	lda.w playerpad,x
	bpl .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .4
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w temp5,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.4:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .5, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .5
	jmp.w .10
.5:									; A + aidef,x, if the result >= 0 go to .6, A = $0000
	clc
	adc.w aidef,x
	bpl .6
	lda.w #$0000
.6:									; temp1,x = A, d0 = pucky, if pfgoal,x is not 0 go to .7, A = $0000, ...
	sta.w temp1,x
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.7:									; d2 = 0, A = d0, A - $FFA4, if the result < 0 go to .8, ...
	stz.b d2
	lda.b d0
	sec
	sbc.w #$FFA4
	bmi .8
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$005C
	bmi .8
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .8
	asl.b d2
	lda.b d0
	sec
	sbc.w #$010E
	bmi .8
	lda.w #$0018
	sta.b d2
.8:									; if d2 is not temp5,x go to .9, if seed+2 >= $0200 go to .10
	lda.b d2
	cmp.w temp5,x
	bne .9
	lda.w seed+2
	cmp.w #$0200
	bcs .10
.9:									; temp5,x = d2, Y = A, a0+2 = CenterOSpots>>16, a0 = CenterOSpots, ...
	lda.b d2
	sta.w temp5,x
	tay
	lda.w #CenterOSpots>>16
	sta.b a0+2
	lda.w #CenterOSpots
	sta.b a0
	iny
	iny
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w temp3,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w temp4,x
.10:								; d0 = temp3,x, d1 = temp4,x, if pfgoal,x is not 0 go to .11, ...
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w pfgoal,x
	bne .11
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.11:								; a0+2 = EvadePC>>16, a0 = EvadePC&$FFFF, go to skateto
	lda.w #EvadePC>>16
	sta.b a0+2
	lda.w #EvadePC&$FFFF
	sta.b a0
	jml.l skateto
	rtl								; unreached: no code branches, falls or points here
