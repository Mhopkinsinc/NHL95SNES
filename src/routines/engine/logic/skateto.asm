skateto:							; called from other segments
	lda.w temp2,x
	sec
	sbc.w timestep
	sta.w temp2,x
	bmi .1
	jmp.w .9
.1:									; A + $000C, temp2,x = A, d0+2 = d0, d1+2 = d1, ...
	adc.w #$000C
	sta.w temp2,x
	lda.b d0
	sta.b d0+2
	lda.b d1
	sta.b d1+2
	jsl.l avdgoal
	lda.w Xvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A xor $FFFF, A + 1, r3 = A, A + d0, ...
	eor.w #$FFFF
	inc a
	sta.b r3
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Yvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A xor $FFFF, A + 1, $42 = A, A + d1, ...
	eor.w #$FFFF
	inc a
	sta.b $42
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w position,x
	bne .4
	lda.w goalieflags,x
	bit.w #$0002
	beq .7
.4:									; Y = Xvel,x, A = Yvel,x, call ApproxLength, push A, ...
	pei ($7F)
	pei ($83)
	ldy.w Xvel,x
	lda.w Yvel,x
	jsl.l ApproxLength
	pha
	lda.b r3
	clc
	adc.b d0+2
	sec
	sbc.w Xpos,x
	tay
	lda.b $42
	clc
	adc.b d1+2
	sec
	sbc.w Ypos,x
	jsl.l ApproxLength
	tay
	pla
	sta.b r3
	pla
	sta.b d1
	pla
	sta.b d0
	lda.b r3
	cmp.w #$1000
	bcs .5
	cpy.w #$0005
	bpl .7
	bra .6
.5:									; if Y - $000C >= 0 go to .7
	cpy.w #$000C
	bpl .7
.6:									; d0 = $0009, go to .8
	lda.w #$0009
	sta.b d0
	bra .8
.7:									; call vtoa
	jsl.l vtoa
.8:									; jmlvector+1 = a0, jmlvector+2 = $64, call jmlvector, temp2b,x = d0, ...
	lda.b a0
	sta.w jmlvector+1
	lda.b $64
	sta.w jmlvector+2
	jsl.l jmlvector
	lda.b d0
	sta.w temp2b,x
	cmp.w #$0008
	bcc .9
	lda.w Xvel,x
	ora.w Yvel,x
	bne .9
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
.9:									; d0 = temp2b,x, go to doplayeracc
	lda.w temp2b,x
	sta.b d0
	jml.l doplayeracc
