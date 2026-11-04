checkgoal:							; from checkwallcoll and other segments
	cpx.w #$001C
	beq .1
	jmp.w checkgoalp
.1:									; if puckc < 0 go to .2, if position,y = 0 go to .rtl
	ldy.w puckc
	bmi .2
	lda.w position,y
	beq .rtl
.2:									; if puckz - $000D >= 0 go to .rtl, Y = a2, A = d2, A - Xpos,y, ...
	lda.w puckz
	cmp.w #$000D
	bpl .rtl
	ldy.b a2
	lda.b d2
	sec
	sbc.w Xpos,y
	sta.b d2
	cmp.w #$0017
	bpl .rtl
	lda.b d2
	cmp.w #$FFEA
	bmi .rtl
	lda.w #$0009
	sta.b d5
	lda.b d3
	sec
	sbc.w Ypos,y
	sta.b d3
	cmp.w #$000A
	bpl .rtl
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
	lda.b d3
	cmp.w #$FFF7
	bmi .rtl
	lda.w #$FFFF
	sta.w collflag
	lda.w puckoldz
	cmp.w #$000D
	bmi .3
	lda.w puckoldz
	sta.w puckz
	jmp.w .18
.rtl:								; return
	rtl
.3:									; pfgoal+28 = 0, if puckc < 0 go to .5, Y = A, puckc = $FFFF, ...
	stz.w pfgoal+28
	lda.w puckc
	bmi .5
	tay
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0008
	sta.w nopuck,y
	lda.w pucky
	sta.b d1
	lda.w pfgoal,y
	bne .4
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.4:									; if d1 >= 0 go to .5, pfgoal+28 = $0001
	lda.b d1
	bpl .5
	lda.w #$0001
	sta.w pfgoal+28
.5:									; d0 = $FF01, p0 = $FF01, A = Yfrac,x, A - OldYfrac,x, ...
	lda.w #$FF01
	sta.b d0
	lda.w #$FF01
	sta.b p0
	lda.w Yfrac,x
	sec
	sbc.w OldYfrac,x
	sta.b d1
	lda.w Ypos,x
	sbc.w OldYpos,x
	sta.b d1+2
	lda.b $84
	sta.b d1
	cmp.w #$0000
	beq .9
	bmi .6
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b p0
	sta.b p0
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
.6:									; A = d5, A + d3, d5 = A, r2 = A, ...
	lda.b d5
	clc
	adc.b d3
	sta.b d5
	sta.b r2
	lda.w Xfrac,x
	sec
	sbc.w OldXfrac,x
	sta.b d3
	lda.w Xpos,x
	sbc.w OldXpos,x
	sta.b d3+2
	lda.b $8C
	sta.b d3
	ldx.b r2
	jsl.l Mul16S
	ldx.b a3
	lda.b d1
	bit.w #$8000
	beq .7
	eor.w #$FFFF
	inc a
.7:									; r1 = A, A = r2+2, if $8000 bits clear go to .8, A xor $FFFF, ...
	sta.b r1
	lda.b r2+2
	bit.w #$8000
	beq .8
	eor.w #$FFFF
	inc a
.8:									; if A >= r1 go to .9, r1 = d1, call Div32S, d5 = r0, ...
	cmp.b r1
	bcs .9
	lda.b d1
	sta.b r1
	jsl.l Div32S
	lda.b r0
	sta.b d5
	ldx.b a3
	lda.b d2
	sec
	sbc.b d5
	sta.b d2
	cmp.w #$FFEA
	bmi .9
	lda.b d2
	cmp.w #$0017
	bmi .14
.9:									; go to .20
	jmp.w .20
.10:								; if puckvy - $0800 >= 0 go to .12, if puckvy - $F800 < 0 go to .12, ...
	lda.w puckvy
	cmp.w #$0800
	bpl .12
	cmp.w #$F800
	bmi .12
	cmp.w #$0000
	bpl .11
	lda.w #$F800
	sta.w puckvy
	bra .12
.11:								; puckvy = $0800
	lda.w #$0800
	sta.w puckvy
.12:								; go to wallcoll
	jmp.w wallcoll
.13:								; go to Goal
	jmp.w Goal
.14:								; d1 = 0, A = pucky, if the result < 0 go to .10, A = $0000, ...
	stz.b d1
	lda.w pucky
	eor.b p0
	bmi .10
	lda.w #$0000
	sec
	sbc.b p0
	sta.b p0
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w pfgoal+28
	bne .10
	lda.w puckz
	cmp.w #$000D
	beq .15
	lda.b d2
	cmp.w #$0012
	bpl .15
	lda.b d2
	cmp.w #$FFEF
	bpl .13
.15:								; call ChkShotStat, breakaway = 0, onetimer = 0, A = $000C, ...
	jsl.l ChkShotStat
	stz.w breakaway
	stz.w onetimer
	lda.w #$000C
	jsl.l StartSound
	lda.l Crowdlevel
	clc
	adc.w #$012C
	sta.l Crowdlevel
	lda.w #$003C
	sta.b crowdhold
	lda.w CwdExciteLvl
	clc
	adc.w #$0028
	bmi .16
	sta.w CwdExciteLvl
.16:								; call RandomWord, A and $0FFF, d0 = A, if pucky < 0 go to .17, ...
	jsl.l RandomWord
	and.w #$0FFF
	sta.b d0
	lda.w pucky
	bmi .17
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.17:								; puckvy = d0, call RandomWord, A and $1FFF, A - $1000, ...
	lda.b d0
	sta.w puckvy
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w puckvx
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w puckvz
	jmp.w puckflip
.18:								; A = puckvz, if $8000 bits clear go to .19, A xor $FFFF, A + 1
	lda.w puckvz
	bit.w #$8000
	beq .19
	eor.w #$FFFF
	inc a
.19:								; puckvz = A, return
	sta.w puckvz
	rtl
.20:								; if puckvx - $0800 >= 0 go to .22, if puckvx - $F800 < 0 go to .22, ...
	lda.w puckvx
	cmp.w #$0800
	bpl .22
	cmp.w #$F800
	bmi .22
	cmp.w #$0000
	bpl .21
	lda.w #$F800
	sta.w puckvx
	bra .22
.21:								; puckvx = $0800
	lda.w #$0800
	sta.w puckvx
.22:								; d0 = 0, d1 = $00FF, A = puckx, A - OldXpos+$1C, ...
	stz.b d0
	lda.w #$00FF
	sta.b d1
	lda.w puckx
	sec
	sbc.w OldXpos+$1C
	sta.b d2
	bmi .23
	lda.w #$FF01
	sta.b d1
.23:								; go to wallcoll
	jmp.w wallcoll
