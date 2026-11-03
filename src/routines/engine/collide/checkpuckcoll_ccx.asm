checkpuckcoll_ccx:					; puck collision with player Y: the stick (puckstick) when the puck is
									; low, slow and within reach of the frame's hot spot, else the body
									; (puckbody) when close
	sty.b a2
	cpy.w puckc
	beq .rtl
	cpy.w #$0018
	bcs .rtl
	lda.w position,y
	bmi .rtl
	lda.w pfnc,y
	ora.w nopuck,y
	beq .3
.rtl:								; return
	rtl
.1:									; go to .7
	jmp.w .7
.2:									; go to PuckCollisionStickRange
	jmp.w PuckCollisionStickRange
.3:									; continue
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($8F)
	pei ($91)
	pei ($93)
	pei ($95)
	pei ($97)
	pei ($99)
	lda.w pflags,y
	bit.w #$1000
	bne .1
	lda.w position,y
	beq .2
	lda.w puckz
	cmp.w #$0005
	bpl .1
	lda.w puckvz
	cmp.w #$0100
	bpl .1
	tya
	jsl.l GetFrameHot
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:									; if A >= $000F go to .7, d0 = A, A = d1, A + Ypos,y, ...
	cmp.w #$000F
	bcs .7
	sta.b d0
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .5
	eor.w #$FFFF
	inc a
.5:									; if A >= $000F go to .7, A and $00FF, A * 2, X = A, ...
	cmp.w #$000F
	bcs .7
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	sta.b d1
	lda.b d0
	and.w #$00FF
	asl a
	tax
	lda.b d1
	adc.l SquareTable,x
	sta.b d0
	ldx.b curobj
	lda.w #$00C4
	sta.b d1
	lda.w nopuck+28
	bmi .6
	beq .6
	lsr.b d1
	lsr.b d1
.6:									; if d1 < d0 go to .7, call puckstick, go to PuckCollisionRestore
	lda.b d1
	cmp.b d0
	bcc .7
	jsl.l puckstick
	bra PuckCollisionRestore
.7:									; if position,y is not 0 go to .8, go to PuckCollisionGoalieRange
	lda.w position,y
	bne .8
	jmp.w PuckCollisionGoalieRange
.8:									; A = Xpos,y, A - puckx, if $8000 bits clear go to .9, A xor $FFFF, ...
	lda.w Xpos,y
	sec
	sbc.w puckx
	bit.w #$8000
	beq .9
	eor.w #$FFFF
	inc a
.9:									; if A >= $000D go to PuckCollisionRestore, d0 = A, A = Ypos,y, A - pucky,
									; ...
	cmp.w #$000D
	bcs PuckCollisionRestore
	sta.b d0
	lda.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .10
	eor.w #$FFFF
	inc a
.10:								; if A >= $000D go to PuckCollisionRestore, A and $00FF, A * 2, d1 = A,
									; ...
	cmp.w #$000D
	bcs PuckCollisionRestore
	and.w #$00FF
	asl a
	sta.b d1
	lda.b d0
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	ldx.b d1
	adc.l SquareTable,x
	sta.b d0
	ldx.b a3
	cmp.w #$0091
	bcs PuckCollisionRestore
	jsl.l puckbody
PuckCollisionRestore:				; restore saved puck collision scratch words and return
	pla
	sta.b d6+2
	pla
	sta.b d6
	pla
	sta.b d5+2
	pla
	sta.b d5
	pla
	sta.b d4+2
	pla
	sta.b d4
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl
