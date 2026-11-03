asswingo:							; called from other segments
	cpx.w puckc
	beq .2
	ldy.w puckc
	bmi .3
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .3
	lda.w #$0003
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
	jmp.w .11
.5:									; A + aidef,x, if the result >= 0 go to .6, A = $0000
	clc
	adc.w aidef,x
	bpl .6
	lda.w #$0000
.6:									; temp1,x = A, d0 = pucky, A = puckvy, A / 2, ...
	sta.w temp1,x
	lda.w pucky
	sta.b d0
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq .7
	ora.w #$FC00
.7:									; A + d0, d3 = A, if pfgoal,x is not 0 go to .8, A = $0000, ...
	clc
	adc.b d0
	sta.b d3
	lda.w pfgoal,x
	bne .8
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
.8:									; d2 = 0, A = d3, A - $FFA4, if the result < 0 go to .9, ...
	stz.b d2
	lda.b d3
	sec
	sbc.w #$FFA4
	bmi .9
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$005C
	bmi .9
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .9
	asl.b d2
	lda.b d3
	sec
	sbc.w #$010E
	bmi .9
	lda.w #$0018
	sta.b d2
.9:									; if d2 is not temp5,x go to .10, if seed >= $0200 go to .11
	lda.b d2
	cmp.w temp5,x
	bne .10
	lda.w seed
	cmp.w #$0200
	bcs .11
.10:								; temp5,x = d2, Y = A, a0+2 = WingZoneSpots>>16, a0 = WingZoneSpots, ...
	lda.b d2
	sta.w temp5,x
	tay
	lda.w #WingZoneSpots>>16
	sta.b a0+2
	lda.w #WingZoneSpots
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
.11:								; d0 = temp3,x, if position,x = $0005 go to .12, A = $0000, A - d0, ...
	lda.w temp3,x
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	beq .12
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.12:								; d1 = temp4,x, if pfgoal,x is not 0 go to .13, A = $0000, A - d0, ...
	lda.w temp4,x
	sta.b d1
	lda.w pfgoal,x
	bne .13
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.13:								; a0+2 = EvadePC>>16, a0 = EvadePC, go to skateto
	lda.w #EvadePC>>16
	sta.b a0+2
	lda.w #EvadePC
	sta.b a0
	jml.l skateto
	rtl								; unreached: no code branches, falls or points here
