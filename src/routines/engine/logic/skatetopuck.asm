skatetopuck:						; called from other segments
	jsl.l skatetopuckinit
	lda.w temp2,x
	sec
	sbc.b d7
	sta.w temp2,x
	bmi .1
	jmp.w .5
.1:									; A + $0005, temp2,x = A, call avdgoal, A = X, ...
	adc.w #$0005
	sta.w temp2,x
	jsl.l avdgoal
	pei ($83)
	pei ($7F)
	txa
	jsl.l GetFrameHot
	lda.b d0
	eor.w #$FFFF
	inc a
	sec
	sbc.w Xvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + $01,s, A - Xpos,x, d0 = A, A = d1, ...
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	sec
	sbc.w Yvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A + $03,s, A - Ypos,x, d1 = A, pull A, ...
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w temp2b,x
	lda.w position,x
	beq .5
	lda.w puckvx
	sta.b d0
	lda.w puckvy
	sta.b d1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq .4
	eor.w #$0004
	cmp.w facedir,x
	beq .5
.4:									; A = pucky, A - Ypos,x, d1 = A, push A, ...
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	pha
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	pha
	jsl.l vtoa
	lda.b d0
	sta.b tmp0
	pla
	sta.b d0
	sta.b r0
	pla
	sta.b d1
	lda.w facedir,x
	cmp.b tmp0
	beq .6
.5:									; d0 = temp2b,x, go to doplayeracc
	lda.w temp2b,x
	sta.b d0
	jml.l doplayeracc
.6:									; if puckc < 0 go to .5, A = r0, A / 2, A / 2, ...
	lda.w puckc
	bmi .5
	lda.b r0
	lsr a
	lsr a
	and.w #$01FE
	tax
	lda.l SignedSquareTable,x
	sta.b d0
	lda.b d1
	and.w #$07F8
	lsr a
	lsr a
	tax
	lda.l SignedSquareTable,x
	ldx.b a3
	adc.b d0
	cmp.w #$000E
	bcc .5
	cmp.w #$0028
	bcs .7
	jmp.w Sweepcheck
.7:									; go to .5
	bra .5
