CalcAttrib:							; no caller found (not traced)
	lda.b d0
	asl a
	adc.b d0
	asl a
	asl a
	sta.b r0
	stz.b d0+2
	ldy.b a2
	beq .1
	lda.b r0
	clc
	adc.w #$0138
	sta.b r0
.1:									; a0+2 = $00C3, a0 = tmdata,y, A = [a0], A and $07FF, ...
	lda.w #$00C3
	sta.b a0+2
	lda.w tmdata,y
	sta.b a0
	clc
	lda.b [a0]
	and.w #$07FF
	sta.b a0
	lda.b d0
	asl a
	adc.b a0
	sta.b a0
	lda.b [a0]
	and.w #$3FFF
	sta.b a0
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	stz.b d0
	stz.b d1
	phx
	lda.w #$0000
.2:									; d2 = A, A * 2, X = A, A = BitMaskTable2,x, ...
	sta.b d2
	asl a
	tax
	lda.l BitMaskTable2,x
	bit.b d4+2
	bne .3
	jmp.w .17
.3:									; if X = $000C go to .4, if X is not $001A go to .5
	cpx.w #$000C
	beq .4
	cpx.w #$001A
	bne .5
.4:									; d0+2 + 1
	inc.b d0+2
.5:									; A = $000F, A - d2, p1 = A, A / 2, ...
	lda.w #$000F
	sec
	sbc.b d2
	sta.b p1
	lsr a
	clc
	adc.b a0
	sta.b p0
	lda.b a0+2
	sta.b p0+2
	lda.b [p0]
	sta.b d3
	lda.b d2
	lsr a
	bcc .6
	lda.b d3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d3
.6:									; A = d3, A and $000F, d3 = A, A = p1, ...
	lda.b d3
	and.w #$000F
	sta.b d3
	lda.b p1
	dec a
	dec a
	dec a
	cmp.w #$0006
	bcc .7
	dec a
.7:									; A + r0, X = A, if $7E24DC = 0 go to .8, A = HotColdTable,x, ...
	clc
	adc.b r0
	tax
	lda.l $7E24DC
	beq .8
	lda.w HotColdTable,x
	and.w #$00FF
.8:									; $42 = A, if A < $0080 go to .9, A = $0100, A - $42
	sta.b $42
	cmp.w #$0080
	bcc .9
	lda.w #$0100
	sbc.b $42
.9:									; r3 = A, A * 2, A + r3, A / 2, ...
	sta.b r3
	asl a
	clc
	adc.b r3
	lsr a
	lsr a
	bit.w #$2000
	beq .10
	ora.w #$C000
.10:								; r3 = A, A = $42, if $0080 bits clear go to .11, A = $0000, ...
	sta.b r3
	lda.b $42
	bit.w #$0080
	beq .11
	lda.w #$0000
	sec
	sbc.b r3
	sta.b r3
.11:								; if d4+2 < 0 go to .15, X = p1, A = SingleAttribWeights,x, ...
	lda.b d4+2
	bmi .15
	ldx.b p1
	lda.l SingleAttribWeights,x
	and.w #$00FF
	beq .14
	lda.w #$0012
	ldx.b d3
	jsl.l Mul8U
	clc
	adc.b r3
	bpl .12
	lda.w #$0000
.12:								; if A < $0065 go to .13, A = $0064
	cmp.w #$0065
	bcc .13
	lda.w #$0064
.13:								; d0 = A, pull X, go to .25
	sta.b d0
	plx
	jmp.w .25
.14:								; d0 = d3, pull X, go to .25
	lda.b d3
	sta.b d0
	plx
	jmp.w .25
.15:								; A = p1, A + r2, X = A, A = AttribWeights,x, ...
	lda.b p1
	clc
	adc.b r2
	tax
	lda.l AttribWeights,x
	ldx.b d3
	jsl.l Mul8U
	clc
	adc.b d0
	sta.b d0
	lda.b r3
	ldy.b r2
	beq .16
	asl a
.16:								; A + d1, d1 = A
	clc
	adc.b d1
	sta.b d1
.17:								; A = d2, A + 1, if A - $000F >= 0 go to .18, go to .2
	lda.b d2
	inc a
	cmp.w #$000F
	bpl .18
	jmp.w .2
.18:								; if d1 >= 0 go to .21, A xor $FFFF, A + 1, if r2 is not 0 go to .19, ...
	lda.b d1
	bpl .21
	eor.w #$FFFF
	inc a
	ldx.b r2
	bne .19
	tax
	lda.w #$000A
	bra .20
.19:								; X = A, A = $0007
	tax
	lda.w #$0007
.20:								; call DivX8U, A xor $FFFF, A + d0, d0 = A, ...
	jsl.l DivX8U
	sec
	eor.w #$FFFF
	adc.b d0
	sta.b d0
	lda.b d0
	bpl .24
	stz.b d0
	lda.w #$0000
	bra .24
.21:								; if r2 is not 0 go to .22, X = A, A = $000A, go to .23
	ldx.b r2
	bne .22
	tax
	lda.w #$000A
	bra .23
.22:								; X = A, A = $0007
	tax
	lda.w #$0007
.23:								; call DivX8U, A + d0, d0 = A, if d0 >= 0 go to .24, ...
	jsl.l DivX8U
	clc
	adc.b d0
	sta.b d0
	lda.b d0
	bpl .24
	stz.b d0
	lda.w #$0000
.24:								; d0 = A, pull X, if r2 = 0 go to .25, d0 / 2
	sta.b d0
	plx
	lda.b r2
	beq .25
	lsr.b d0
.25:								; if d0+2 is not 0 go to .rtl, if d0 < $0065 go to .26, A = $0064
	lda.b d0+2
	bne .rtl
	lda.b d0
	cmp.w #$0065
	bcc .26
	lda.w #$0064
.26:								; if A >= $0032 go to .27, A / 2, A + $0019
	cmp.w #$0032
	bcs .27
	lsr a
	clc
	adc.w #$0019
.27:								; d0 = A
	sta.b d0
.rtl:								; return
	rtl
