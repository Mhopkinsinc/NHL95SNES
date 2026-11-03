assnearest:							; called from other segments
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp3,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	stz.w temp1,x
.1:									; if position,x = 0 go to .2, if X is not puckc go to .3, d0 = $0011, ...
	lda.w position,x
	beq .2
	cpx.w puckc
	bne .3
	lda.w #$0011
	sta.b d0
	lda.w playerpad,x
	bpl .rtl
	jmp.w assinsert
.rtl:								; return
	rtl
.2:									; go to assgoalie
	jml.l assgoalie
.3:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .4
	jmp.w .16
.4:									; A + aioff,x, if the result >= 0 go to .5, A = $0000
	adc.w aioff,x
	bpl .5
	lda.w #$0000
.5:									; temp1,x = A, if puckc < 0 go to .6, if position,y = 0 go to .6, ...
	sta.w temp1,x
	ldy.w puckc
	bmi .6
	lda.w position,y
	beq .6
	sty.b a1
	lda.w pfteam,y
	eor.w pfteam,x
	bne .6
	jmp.w .7
.6:									; Y = a2, d2 = tmnear,y, a1 = tmnearpl,y, if d2 < 0 go to .8
	ldy.b a2
	lda.w tmnear,y
	sta.b d2
	lda.w tmnearpl,y
	sta.b a1
	lda.b d2
	bmi .8
.7:									; if X = a1 go to .8, if gmclock is not 0 go to .8, Y = a1, ...
	cpx.b a1
	beq .8
	lda.w gmclock
	bne .8
	ldy.b a1
	lda.w pflags,y
	bit.w #$1000
	bne .8
	lda.w position,y
	beq .8
	lda.w asscur,y
	cmp.w #$0015
	beq .8
	ldx.b a1
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
	ldx.b curobj
	jmp.w assexit
.8:									; d1 = $0002, if d2 >= $00E2 go to .9, d1 = 0, if position,x = 0 go to .16
	lda.w #$0002
	sta.b d1
	lda.b d2
	cmp.w #$00E2
	bcs .9
	stz.b d1
	lda.w position,x
	beq .16
.9:									; A = sflags, if $2000 bits clear go to .10, d1 - 1, d1 - 1, ...
	lda.w sflags
	bit.w #$2000
	beq .10
	dec.b d1
	dec.b d1
	jsl.l chkpk2
	bne .10
	inc.b d1
	inc.b d1
	inc.b d1
	inc.b d1
.10:								; A = $0014, A - checking,x, d0 = A, tmp0 = d1
	lda.w #$0014
	sec
	sbc.w checking,x
	sta.b d0
	lda.b d1
	sta.b tmp0
.loop:								; loop: tmp0 - 1, if the result < 0 go to .15, d0 * 2, go to .loop
	dec.b tmp0
	bmi .15
	asl.b d0
	bra .loop
.rtl2:								; return
	rtl
.11:								; if puckc < 0 go to .14, if position,y is not 0 go to .14, ...
	ldy.w puckc
	bmi .14
	lda.w position,y
	bne .14
	lda.w puckx
	sta.b d0
	lda.w #$005C
	ldy.w pfgoal,x
	bne .12
	lda.w #$FFA4
.12:								; d1 = A, a0+2 = rtss>>16, a0 = rtss&$FFFF, call skateto, ...
	sta.b d1
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jsl.l skateto
	jmp.w check4check
.13:								; call GlideBack, go to donothing
	jsl.l GlideBack
	jmp.w donothing
.14:								; call skatetopuck, go to check4check
	jsl.l skatetopuck
	jmp.w check4check
.15:								; call randomd0, if d0 >= $0002 go to .16, temp3,x = $00F0
	jsl.l randomd0
	lda.b d0
	cmp.w #$0002
	bcs .16
	lda.w #$00F0
	sta.w temp3,x
.16:								; if playerpad,x >= 0 go to .rtl2, if gmclock is not 0 go to .13, ...
	lda.w playerpad,x
	bpl .rtl2
	lda.w gmclock
	bne .13
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	bne .17
	lda.w puckc
	bmi .11
	lda.w temp3,x
	sec
	sbc.b d7
	sta.w temp3,x
	cmp.w #$0000
	bpl .11
	stz.w temp3,x
.17:								; call skatetopuckinit, A = d0, push A, A xor $FFFF, ...
	jsl.l skatetopuckinit
	pei ($83)
	lda.b d0
	pha
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	clc
	adc.w #$00FA
	sta.b d1
	lda.w pfgoal,x
	beq .18
	lda.b d1
	sec
	sbc.w #$01F4
	sta.b d1
.18:								; A = d0, push A, A * 2, pull A, ...
	lda.b d0
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.b d1
	pha
	asl a
	pla
	ror a
	sta.b d1
	pla
	clc
	adc.b d0
	sta.b d0
	pla
	clc
	adc.b d1
	sta.b d1
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	beq .20
	lda.w pfgoal,x
	beq .19
	lda.b d1
	sec
	sbc.w #$0057
	bmi .20
	lda.w #$0048
	sta.b d1
	bra .20
.19:								; A = d1, A - $FFA9, if the result >= 0 go to .20, d1 = $FFB8
	lda.b d1
	sec
	sbc.w #$FFA9
	bpl .20
	lda.w #$FFB8
	sta.b d1
.20:								; a0+2 = rtss>>16, a0 = rtss&$FFFF, call skateto, go to check4check
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jsl.l skateto
	jmp.w check4check
