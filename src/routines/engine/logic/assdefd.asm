assdefd:							; called from other segments
	ldy.w puckc
	bmi .2
	lda.w pfteam,x
	cmp.w pfteam,y
	bne .2
	lda.w #$0001
	sta.b d0
	jmp.w assreplace
.rtl:								; return
	rtl
.1:									; go to donothing
	jmp.w donothing
.2:									; if gmclock is not 0 go to .1, call check4bench, ...
	lda.w gmclock
	bne .1
	jsl.l check4bench
	lda.w playerpad,x
	bpl .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.3:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .4
	jmp.w DefenceSkateAndCheck
.4:									; A + aidef,x, if the result >= 0 go to .5, A = $0000
	clc
	adc.w aidef,x
	bpl .5
	lda.w #$0000
.5:									; temp1,x = A, d1 = pucky, A = puckvy, A / 2, ...
	sta.w temp1,x
	lda.w pucky
	sta.b d1
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq .6
	ora.w #$FC00
.6:									; d3 = A, if pfgoal,x is not 0 go to .7, A = $0000, A - d1, ...
	sta.b d3
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
.7:									; if d3 >= 0 go to .8, d3 = 0
	lda.b d3
	bpl .8
	stz.b d3
.8:									; A = d3, A + d1, d3 = A, A - $005C, ...
	lda.b d3
	clc
	adc.b d1
	sta.b d3
	sec
	sbc.w #$005C
	bmi .10
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .10
	lda.w puckc
	bmi .9
	lsr a
.9:									; d1 = A, if minus go to .10, call chkpk, if zero go to .10, ...
	sta.b d1
	bmi .10
	jsl.l chkpk
	beq .10
	lda.b d1
	sec
	sbc.w #$0006
	sta.b d1
	txa
	lsr a
	sec
	sbc.w #$0006
	sta.b d2
	eor.b d1
	sta.b d1
.10:								; temp3,x = $0041, if position,x = $0002 go to .11, temp3,x = $FFBF
	lda.w #$0041
	sta.w temp3,x
	lda.w position,x
	cmp.w #$0002
	beq .11
	lda.w #$FFBF
	sta.w temp3,x
.11:								; Y = $0000, if X >= $000C go to .12, Y = $000C
	ldy.w #$0000
	cpx.w #$000C
	bcs .12
	ldy.w #$000C
.12:								; d2 = $0006, d0 = $FC18, if pfgoal,x = 0 go to DefenceScanTopThreats, d0
									; = $03E8
	lda.w #$0006
	sta.b d2
	lda.w #$FC18
	sta.b d0
	lda.w pfgoal,x
	beq DefenceScanTopThreats
	lda.w #$03E8
	sta.b d0
.loop:								; loop: a0 = Y, A = pflags,y, if a $1000 bit set go to .15, ...
	sty.b a0
	lda.w pflags,y
	bit.w #$1000
	bne .15
	lda.w position,y
	bmi .15
	lda.w Yvel,y
	bmi .13
	lda.w #$0000
.13:								; A / 2, A / 2, A / 2, A / 2, ...
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq .14
	ora.w #$F800
.14:								; A + Ypos,y, d1 = A, A - d0, if the result >= 0 go to .15, ...
	clc
	adc.w Ypos,y
	sta.b d1
	sec
	sbc.b d0
	bpl .15
	lda.b d1
	sta.b d0
.15:								; Y = a0, Y + 1, Y + 1, d2 - 1, ...
	ldy.b a0
	iny
	iny
	dec.b d2
	bne .loop
	lda.b d0
	sec
	sbc.w #$0028
	sta.b d0
	sec
	sbc.w #$FF42
	bpl .16
	lda.w #$FF24
	sta.b d0
.16:								; temp4,x = d0, d0 = puckx, A = temp3,x, A xor d0, ...
	lda.b d0
	sta.w temp4,x
	lda.w puckx
	sta.b d0
	lda.w temp3,x
	eor.b d0
	sta.b d1
	bpl DefenceSkateAndCheck
	stz.w temp3,x
	bra DefenceSkateAndCheck
	rtl								; unreached: no code branches, falls or points here
