wallcoll:							; from WallPlayerResponse, checkgoalp, checkgoal, ...
	lda.b d0
	sta.w Wallcos,x
	lda.b d1
	sta.w Wallsin,x
	pei ($87)
	pei ($8B)
	pei ($83)
	lda.b d0
	pha
	txy
	ldx.w Yvel,y
	jsl.l Mul16x8S
	lda.b $35
	sta.b d0
	ldx.w Xvel,y
	lda.b d1
	jsl.l Mul16x8S
	lda.b d0
	sec
	sbc.b $35
	eor.w #$FFFF
	inc a
	sta.b d2
	ldx.w Xvel,y
	lda.b $01,s
	jsl.l Mul16x8S
	lda.b $35
	sta.b d0
	ldx.w Yvel,y
	lda.b d1
	jsl.l Mul16x8S
	lda.b $35
	clc
	adc.b d0
	sta.b d3
	tyx
	cpx.w #$001C
	beq .1
	jmp.w .10
.1:									; A = $1000, if d2 < 0 go to .2, go to .14
	lda.w #$1000
	trb.w sflags
	lda.b d2
	bmi .2
	jmp.w .14
.2:									; A / 2, A / 2, if $2000 bits clear go to .3, A or $C000
	lsr a
	lsr a
	bit.w #$2000
	beq .3
	ora.w #$C000
.3:									; d2 = A, A - $FC00, if the result >= 0 go to .7, call RandomWord, ...
	sta.b d2
	sec
	sbc.w #$FC00
	bpl .7
	jsl.l RandomWord
	and.w #$07FF
	eor.w #$FFFF
	inc a
	sta.w puckvz
	sta.b d0
	jsl.l puckflip
	lda.w puckvx
	ldy.w puckvy
	jsl.l ApproxLength
	and.w #$7F00
	sta.b tmp0
	xba
	tsb.b tmp0
	bit.w puckx
	bpl .4
	sep #$20
	lsr a
	lsr a
	sta.b $A0
	bra .5
.4:									; A 8-bit, A / 2, A / 2, tmp0 = A
	sep #$20
	lsr a
	lsr a
	sta.b tmp0
.5:									; A 16-bit, A = $0003, if puckz >= $000B go to .6, A = $0003
	rep #$20
	lda.w #$0003
	ldy.w puckz
	cpy.w #$000B
	bcs .6
	lda.w #$0003
.6:									; call StartSoundVolume
	jsl.l StartSoundVolume
.7:									; A = d3, A / 2, A / 2, A / 2, ...
	lda.b d3
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq .8
	ora.w #$FC00
.8:									; d0 = A, push A, A * 2, pull A, ...
	sta.b d0
	pha
	asl a
	pla
	ror a
	sta.b d0+2
	lda.b d3
	sec
	sbc.b d0
	sec
	sbc.b d0+2
	sta.b d3
	bra .13
.9:									; go to .14
	jmp.w .14
.10:								; A = d2, A - $03E8, if the result >= 0 go to .9, A = d2, ...
	lda.b d2
	sec
	sbc.w #$03E8
	bpl .9
	lda.b d2
	sec
	sbc.w #$F000
	bpl .11
	lda.w impact,x
	sec
	sbc.w #$000A
	bmi .11
	lda.w Xvel,x
	sta.b p0
	lda.w Yvel,x
	sta.b p0+2
	lda.w #$0003
	jsl.l StartSound
.11:								; A = d2, A / 2, A / 2, if $2000 bits clear go to .12, ...
	lda.b d2
	lsr a
	lsr a
	bit.w #$2000
	beq .12
	ora.w #$C000
.12:								; d2 = A, A - $FC7C, if the result < 0 go to .13, d2 = $FC18
	sta.b d2
	sec
	sbc.w #$FC7C
	bmi .13
	lda.w #$FC18
	sta.b d2
.13:								; A = $01,s, X = d3, call Mul16x8S, tmp0 = $35, ...
	lda.b $01,s
	ldx.b d3
	jsl.l Mul16x8S
	lda.b $35
	sta.b tmp0
	lda.b $03,s
	ldx.b d2
	jsl.l Mul16x8S
	lda.b tmp0
	sec
	sbc.b $35
	ldx.b a3
	sta.w Xvel,x
	lda.b $03,s
	ldx.b d3
	jsl.l Mul16x8S
	lda.b $35
	sta.b d3
	lda.b $01,s
	ldx.b d2
	jsl.l Mul16x8S
	lda.b $35
	clc
	adc.b d3
	ldx.b a3
	sta.w Yvel,x
	lda.w puckvz
	bmi .14
	stz.w puckvz
.14:								; pull A, pull A, pull A, d3 = A, ...
	pla
	pla
	pla
	sta.b d3
	pla
	sta.b d2
	cpx.w #$001C
	bne .rtl
	lda.w puckc
	bpl .rtl
	jsl.l EndPenaltyShot
	stz.w breakaway
	stz.w onetimer
.rtl:								; return
	rtl
