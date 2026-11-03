checkcx:							; collides player X with player Y: their distance and closing speed, the
									; collision sound, checkint, checkcheck and the bounce
	pei ($7F)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($8B)
	pei ($8F)
	pei ($93)
	sty.b a2
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d3
	ldy.b d2
	jsl.l ApproxLength
	cmp.w #$0010
	bmi .1
	jmp.w .16
.1:									; Y = a2, A = Xvel,x, A - Xvel,y, d0 = A, ...
	ldy.b a2
	lda.w Xvel,x
	sec
	sbc.w Xvel,y
	sta.b d0
	lda.w Yvel,x
	sec
	sbc.w Yvel,y
	sta.b d1
	lda.b d0
	ora.b d1
	bne .2
	jmp.w .16
.2:									; A = d3, X = d1, call Mul16x8S, d1+2 = r2+2, ...
	pei ($83)
	pei ($7F)
	lda.b d3
	ldx.b d1
	jsl.l Mul16x8S
	lda.b r2+2
	sta.b d1+2
	lda.b r2
	sta.b d1
	lda.b d2
	ldx.b d0
	jsl.l Mul16x8S
	ldx.b a3
	lda.b r2
	clc
	adc.b d1
	sta.b d1
	lda.b r2+2
	adc.b d1+2
	sta.b d1+2
	bpl .3
	jmp.w .17
.3:									; if SPA,x < SPAHold2&$FFFF go to .5, if SPA,x >= $2345 go to .5, ...
	lda.w SPA,x
	cmp.w #SPAHold2&$FFFF
	bcc .5
	cmp.w #$2345
	bcs .5
	stz.w pfalock,x
	stz.w pf2aip,x
	ldy.w impactp,x
	lda.w SPA,y
	cmp.w #SPAHold2&$FFFF
	bcc .4
	cmp.w #$2345
	bcs .4
	lda.w #$0000
	sta.w pfalock,y
	sta.w pf2aip,y
.4:									; Y = a2
	ldy.b a2
.5:									; if SPA,y < SPAHold2&$FFFF go to .7, if SPA,y >= $2345 go to .7, ...
	lda.w SPA,y
	cmp.w #SPAHold2&$FFFF
	bcc .7
	cmp.w #$2345
	bcs .7
	lda.w #$0000
	sta.w pfalock,y
	sta.w pf2aip,y
	ldx.w impactp,y
	lda.w SPA,x
	cmp.w #SPAHold2&$FFFF
	bcc .6
	cmp.w #$2345
	bcs .6
	stz.w pfalock,x
	stz.w pf2aip,x
.6:									; X = a3
	ldx.b a3
.7:									; d1 = $84, if pfteam,x = pfteam,y go to .14, A = d1, A / 2, ...
	lda.b $84
	sta.b d1
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .14
	lda.b d1
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0005
	bcs .8
	lda.w #$0005
.8:									; d4 = A, if SPA,x < SPAsweepchk&$FFFF go to .10, ...
	sta.b d4
	lda.w SPA,x
	cmp.w #SPAsweepchk&$FFFF
	bcc .10
	cmp.w #$21BD
	bcs .10
.9:									; A = d4, A / 2, A + d4, d4 = A, ...
	lda.b d4
	lsr a
	adc.b d4
	sta.b d4
	bra .11
.10:								; if SPA,y < SPAsweepchk&$FFFF go to .11, if SPA,y < $21BD go to .9
	lda.w SPA,y
	cmp.w #SPAsweepchk&$FFFF
	bcc .11
	cmp.w #$21BD
	bcc .9
.11:								; A = d4, A + impact,x, impact,x = A, A = d4, ...
	lda.b d4
	clc
	adc.w impact,x
	sta.w impact,x
	lda.b d4
	clc
	adc.w impact,y
	sta.w impact,y
	txa
	sta.w impactp,y
	tya
	sta.w impactp,x
	lda.b d4
	cmp.w #$0014
	bcc .13
	cpx.w puckc
	beq .12
	cpy.w puckc
	bne .13
.12:								; call CollisionSfx
	jsl.l CollisionSfx
.13:								; call checkint, call checkcheck, pull A, d3 = A, ...
	pei ($83)
	pei ($87)
	pei ($8B)
	jsl.l checkint
	jsl.l checkcheck
	pla
	sta.b d3
	pla
	sta.b d2
	pla
	sta.b d1
.14:								; d4 = d1, pull A, d0 = A, pull A, ...
	lda.b d1
	sta.b d4
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w collflag
	bpl .15
	jmp.w .16
.15:								; A = d2, X = d1, call Mul16x8S, d1+2 = r2+2, ...
	lda.b d2
	ldx.b d1
	jsl.l Mul16x8S
	lda.b r2+2
	sta.b d1+2
	lda.b r2
	sta.b d1
	lda.b d3
	ldx.b d0
	jsl.l Mul16x8S
	lda.b r2
	sec
	sbc.b d1
	sta.b d1
	lda.b r2+2
	sbc.b d1+2
	sta.b d1+2
	lda.b $84
	sta.b d5
	ldx.b a3
	lda.w weight,x
	clc
	adc.w #$008C
	sta.b d0
	ldy.b a2
	lda.w weight,y
	clc
	adc.w #$008C
	sta.b d1
	lda.b d1
	clc
	adc.b d0
	sta.b d1
	lda.b d0
	ldx.b d4
	jsl.l Mul16x8XS
	lda.b d1
	sta.b r1
	jsl.l Div32S
	lda.b r0
	sta.b d0
	sta.b d1
	lda.b d3
	ldx.b d5
	jsl.l Mul16x8S
	lda.b r2
	sta.b tmp0
	lda.b d2
	ldx.b d0
	jsl.l Mul16x8S
	lda.b r2
	clc
	adc.b tmp0
	ldx.b a3
	clc
	adc.w Xvel,y
	sta.w Xvel,x
	lda.b d2
	ldx.b d5
	jsl.l Mul16x8S
	lda.b r2
	sta.b tmp0
	lda.b d3
	ldx.b d0
	jsl.l Mul16x8S
	lda.b r2
	sec
	sbc.b tmp0
	ldx.b a3
	clc
	adc.w Yvel,y
	sta.w Yvel,x
	lda.b d2
	ldx.b d1
	jsl.l Mul16x8S
	lda.b r2
	clc
	adc.w Xvel,y
	sta.w Xvel,y
	lda.b d3
	ldx.b d1
	jsl.l Mul16x8S
	lda.b r2
	clc
	adc.w Yvel,y
	sta.w Yvel,y
	ldx.b a3
	lda.w #$FFFF
	sta.w collflag
.16:								; pull A, d5 = A, pull A, d4 = A, ...
	pla
	sta.b d5
	pla
	sta.b d4
	pla
	sta.b d3
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0
	rtl
.17:								; pull A, pull A, go to .16
	pla
	pla
	bra .16
