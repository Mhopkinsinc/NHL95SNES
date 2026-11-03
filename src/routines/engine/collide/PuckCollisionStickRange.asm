PuckCollisionStickRange:			; test the frame hotspot reach and puck height for stick contact
	tya
	jsl.l GetHot
	lda.b d0
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:									; d2 = A, A * 2, X = A, d4 = TwoThirds,x, ...
	sta.b d2
	asl a
	tax
	lda.l TwoThirds,x
	sta.b d4
	lda.b d1
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:									; A * 2, X = A, d3 = TwoThirds,x, X = curobj, ...
	asl a
	tax
	lda.l TwoThirds,x
	sta.b d3
	ldx.b curobj
	lda.b a2
	jsl.l GetHot
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:									; if A >= d2 go to .6, d0 = A, A = d1, A + Ypos,y, ...
	cmp.b d2
	bcs .6
	sta.b d0
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:									; if A >= d2 go to .6, d1 = A, A = d3, A + d4, ...
	cmp.b d2
	bcs .6
	sta.b d1
	lda.b d3
	clc
	adc.b d4
	cmp.w #$0005
	bpl .5
	lda.w #$0005
.5:									; if A < puckz go to .6, A = d3, A - d4, if the result < 0 go to .7, ...
	cmp.w puckz
	bcc .6
	lda.b d3
	sec
	sbc.b d4
	bmi .7
	cmp.w puckz
	bcc .7
.6:									; go to PuckCollisionGoalieRange
	jmp.w PuckCollisionGoalieRange
.7:									; A = d0, A and $00FF, A * 2, X = A, ...
	lda.b d0
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	sta.b d0
	lda.b d1
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	adc.b d0
	sta.b d0
	lda.b d2
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	ldx.b curobj
	sta.b d1
	lda.w nopuck+28
	bmi .8
	beq .8
	lsr.b d1
	lsr.b d1
.8:									; if d1 < d0 go to .9, call puckstick
	lda.b d1
	cmp.b d0
	bcc .9
	jsl.l puckstick
.9:									; go to PuckCollisionGoalieRange
	jmp.w PuckCollisionGoalieRange
