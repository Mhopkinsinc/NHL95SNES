doshot:								; from ShotMode, PassReceiverOneTimer, ...
	jsl.l shotdiradj
	pea.w $000D
	lda.w passspeed
	lsr a
	adc.w passspeed
	sta.w passspeed
	lda.w #$0008
	trb.w sflags
	sta.w pfalock,x
	stx.w shotplayer
	cpx.w puckc
	beq .1
	jmp.w .15
.1:									; $01,s = $000E, A = $1000, if SPA,x is not SPAshotb&$FFFF go to .2, ...
	lda.w #$000E
	sta.b $01,s
	lda.w #$1000
	tsb.w sflags
	lda.w SPA,x
	cmp.w #SPAshotb&$FFFF
	bne .2
	lda.w #$000E
	sta.b $01,s
.2:									; lastshotspeed = passspeed, if passspeed < $001E go to .3, $01,s = $0010
	lda.w passspeed
	sta.w lastshotspeed
	cmp.w #$001E
	bcc .3
	lda.w #$0010
	sta.b $01,s
.3:									; A = shotspd,x, a0 = X, call makepde, A + $0014, ...
	lda.w shotspd,x
	stx.b a0
	jsl.l makepde
	adc.w #$0014
	tax
	lda.w passspeed
	jsl.l Mul16x8U
	ldx.b r2
	lda.w #$2570
	jsl.l Mul16U
	lda.b r2+2
	sta.w passspeed
	lda.w breakaway
	beq .4
	jsl.l CheckBreakaway
	lda.w IsBreakaway
	sta.w breakaway
.4:									; X = curobj, puckc = $FFFF, nopuck,x = $000C, A = X, ...
	ldx.b curobj
	lda.w #$FFFF
	sta.w puckc
	lda.w #$000C
	sta.w nopuck,x
	txa
	lsr a
	sta.w lastplayer
	ldy.w #$010E
	lda.w pfgoal,x
	bne .5
	ldy.w #$FEF2
.5:									; d1 = Y, A = passdir, A * 2, A * 2, ...
	sty.b d1
	lda.w passdir
	asl a
	asl a
	tay
	lda.w #doshot_shotsets&$FFFF
	sta.b a0
	lda.w #doshot_shotsets>>16
	sta.b a0+2
	lda.b [a0],y
	sec
	sbc.w puckx
	sta.b d0
	iny
	iny
	lda.b [a0],y
	sta.b d2
	pha
	lda.b d1
	sec
	sbc.w pucky
	sta.b d1
	pha
	lda.b d0
	pha
	ldy.b d1
	jsl.l ApproxLength
	cmp.w #$0000
	bne .6
	inc a
.6:									; d3 = A, A = gmode, if $0010 bits clear go to .7, go to .13
	sta.b d3
	lda.w gmode
	bit.w #$0010
	beq .7
	jmp.w .13
.7:									; if d3 >= $00C9 go to .8, A = $0010, A + shotacc,x, call randoma8, ...
	lda.b d3
	cmp.w #$00C9
	bcs .8
	lda.w #$0010
	adc.w shotacc,x
	jsl.l randoma8
	cmp.w #$000F
	bcs .13
.8:									; A = passspeed, A / 2, A / 2, A / 2, ...
	lda.w passspeed
	lsr a
	lsr a
	lsr a
	sec
	sbc.w shotacc,x
	clc
	adc.w #$0010
	ldx.b d3
	jsl.l Mul16U
	lda.b r2
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	ldx.b d3
	cpx.w #$012D
	bcs .9
	lsr a
.9:									; if A < $009B go to .10, A = $009B
	cmp.w #$009B
	bcc .10
	lda.w #$009B
.10:								; push A, call randomd0s, A + $03,s, $03,s = A, ...
	pha
	jsl.l randomd0s
	adc.b $03,s
	sta.b $03,s
	lda.b $01,s
	cmp.w #$003D
	bcc .11
	lda.w #$003C
	sta.b $01,s
.11:								; d0 = A, if $05,s >= 0 go to .12, d0 / 2
	sta.b d0
	lda.b $05,s
	bpl .12
	lsr.b d0
.12:								; call randomd0sd0, A + $05,s, $05,s = A, pull A, ...
	jsl.l randomd0sd0
	adc.b $05,s
	sta.b $05,s
	pla
	lsr a
	jsl.l randomd0A
	adc.b $05,s
	sta.b $05,s
.13:								; X = passspeed, A = $0044, call Mul16x8XS, A = r2, ...
	ldx.w passspeed
	lda.w #$0044
	jsl.l Mul16x8XS
	lda.b r2
	plx
	pha
	jsl.l Mul16S
	lda.b d3
	sta.b r1
	jsl.l Div32S
	lda.b r0
	asl a
	sta.w puckvx
	pla
	plx
	jsl.l Mul16S
	lda.b d3
	sta.b r1
	jsl.l Div32S
	lda.b r0
	asl a
	sta.w puckvy
	ldx.b curobj
	pla
	beq .15
	tax
	lda.w passspeed
	jsl.l Mul16U
	ldx.b r2
	lda.w #$0044
	jsl.l Mul16x8U
	lda.b d3
	sta.b r1
	jsl.l Div32U
	lda.b r0
	asl a
	sta.b d1
	lda.w #$0B33
	ldx.b d3
	jsl.l Mul16U
	lda.w passspeed
	sta.b r1
	jsl.l Div32U
	ldx.b curobj
	lda.b r0
	lsr a
	adc.b d1
	cmp.w #$1801
	bcc .14
	lda.w #$1800
.14:								; puckvz = A
	sta.w puckvz
.15:								; pull A, call StartSound, X = a3, Y = $010E, ...
	pla
	jsl.l StartSound
	ldx.b a3
	ldy.w #$010E
	lda.w pfgoal,x
	bne .16
	ldy.w #$FEF2
.16:								; tmp0 = Y, A = Y, A - pucky, if the result >= 0 go to .17, ...
	sty.b tmp0
	tya
	sec
	sbc.w pucky
	eor.w puckvy
	bpl .17
	lda.w #$0000
	sec
	sbc.w puckvy
	sta.w puckvy
.17:								; if PenShotActive = 0 go to .rtl, d0 = $0012, call assreplace
	lda.w PenShotActive
	beq .rtl
	lda.w #$0012
	sta.b d0
	jsl.l assreplace
.rtl:								; return
	rtl
