CalcRosterAttrib:					; the rating of roster player d0 of team a2 for the attributes in mask d4:
									; CalcAttrib's weighted sum with the hot / cold bytes, read from the
									; roster table's player record
	stz.b d0+2
	ldx.w #HomeRoster
	lda.b d0
	asl a
	adc.b d0
	asl a
	asl a
	ldy.b a2
	beq .1
	adc.w #$0138
	ldx.w #VisRoster
.1:									; d2+2 = A, d1 = 0, d1+2 = 0, A = d0, ...
	sta.b d2+2
	stz.b d1
	stz.b d1+2
	lda.b d0
	asl a
	asl a
	asl a
	asl a
	asl a
	stx.b d0
	adc.b d0
	sta.b d0
	lda.w #$000F
.2:									; d2 = A, A * 2, X = A, A = BitMaskTable2,x, ...
	sta.b d2
	asl a
	tax
	lda.l BitMaskTable2,x
	bit.b d4
	bne .3
	jmp.w .15
.3:									; if A = $0004 go to .4, if A is not $0200 go to .5
	cmp.w #$0004
	beq .4
	cmp.w #$0200
	bne .5
.4:									; d0+2 + 1
	inc.b d0+2
.5:									; A = d2, A / 2, A + d0, X = A, ...
	lda.b d2
	lsr a
	php
	clc
	adc.b d0
	tax
	lda.w $0110,x
	plp
	bcs .6
	lsr a
	lsr a
	lsr a
	lsr a
.6:									; A and $000F, d3 = A, if RatingMode = 0 go to .9, A = d2, ...
	and.w #$000F
	sta.b d3
	lda.w RatingMode
	beq .9
	lda.b d2
	dec a
	dec a
	dec a
	cmp.w #$0006
	bcc .7
	dec a
.7:									; A + d2+2, X = A, A = HotColdTable,x, A and $00FF, ...
	clc
	adc.b d2+2
	tax
	lda.w HotColdTable,x
	and.w #$00FF
	tay
	sta.b d3+2
	cmp.w #$0080
	bcc .8
	lda.w #$0100
	sbc.b d3+2
	sta.b d3+2
.8:									; A * 2, A + d3+2, A / 2, A / 2, ...
	asl a
	adc.b d3+2
	lsr a
	lsr a
	sta.b d3+2
	cpy.w #$0080
	bcc .9
	lda.w #$0000
	sbc.b d3+2
.9:									; d3+2 = A, A = d4, if a $0001 bit set go to .13, X = d3, ...
	sta.b d3+2
	lda.b d4
	bit.w #$0001
	bne .13
	ldx.b d3
	lda.b d2
	cmp.w #$0002
	beq .12
	cmp.w #$0009
	beq .12
	lda.w #$0012
	jsl.l Mul8U
	clc
	adc.b d3+2
	bpl .10
	lda.w #$0000
.10:								; if A < $0065 go to .11, A = $0064
	cmp.w #$0065
	bcc .11
	lda.w #$0064
.11:								; if A >= $0032 go to .rts, A / 2, A + $0019
	cmp.w #$0032
	bcs .rts
	lsr a
	clc
	adc.w #$0019
.rts:								; return
	rts
.12:								; A = X, return
	txa
	rts
.13:								; A = d2, A + d4+2, X = A, A = RosterAttribWeights,x, ...
	lda.b d2
	clc
	adc.b d4+2
	tax
	lda.l RosterAttribWeights,x
	ldx.b d3
	jsl.l Mul8U
	clc
	adc.b d1
	sta.b d1
	lda.b d3+2
	ldy.b d4+2
	beq .14
	asl a
.14:								; A + d1+2, d1+2 = A
	clc
	adc.b d1+2
	sta.b d1+2
.15:								; A = d2, A - 1, if the result = 0 go to .16, go to .2
	lda.b d2
	dec a
	beq .16
	jmp.w .2
.16:								; if d1+2 >= 0 go to .18, A xor $FFFF, A + 1, X = A, ...
	lda.b d1+2
	bpl .18
	eor.w #$FFFF
	inc a
	tax
	lda.w #$000A
	ldy.b d4+2
	beq .17
	lda.w #$0007
.17:								; call DivX8U, A xor $FFFF, A + d1, if the result >= 0 go to .20, ...
	jsl.l DivX8U
	eor.w #$FFFF
	sec
	adc.b d1
	bpl .20
	lda.w #$0000
	bra .20
.18:								; X = A, A = $000A, if d4+2 = 0 go to .19, A = $0007
	tax
	lda.w #$000A
	ldy.b d4+2
	beq .19
	lda.w #$0007
.19:								; call DivX8U, A + d1, if the result >= 0 go to .20, A = $0000
	jsl.l DivX8U
	clc
	adc.b d1
	bpl .20
	lda.w #$0000
.20:								; if d4+2 = 0 go to .21, A / 2
	ldx.b d4+2
	beq .21
	lsr a
.21:								; go to .10
	bra .10
