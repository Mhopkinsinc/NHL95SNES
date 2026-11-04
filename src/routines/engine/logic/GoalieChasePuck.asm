GoalieChasePuck:					; steer the goalie toward the predicted puck position
	lda.w temp2,x
	sec
	sbc.b d7
	sta.w temp2,x
	bmi .1
	jmp.w .6
.1:									; A + $0005, temp2,x = A, A = puckvx, A and $00FF, ...
	adc.w #$0005
	sta.w temp2,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + puckx, d0 = A, A = puckvy, A and $00FF, ...
	clc
	adc.w puckx
	sta.b d0
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A + pucky, d1 = A, call avdgoal, A = d0, ...
	clc
	adc.w pucky
	sta.b d1
	jsl.l avdgoal
	pei ($83)
	lda.b d0
	pha
	txa
	jsl.l GetHot
	lda.b d0
	eor.w #$FFFF
	inc a
	sec
	sbc.w Xvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:									; A + $01,s, A - Xpos,x, d0 = A, A = d1, ...
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
	beq .5
	ora.w #$FF00
.5:									; A + $03,s, A - Ypos,x, d1 = A, pull A, ...
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
.6:									; d0 = temp2b,x, go to doplayeracc
	lda.w temp2b,x
	sta.b d0
	jml.l doplayeracc
