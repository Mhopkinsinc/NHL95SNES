PuckCarrierAvoidThreats:			; count opponents near the predicted puck position and adjust skating
									; direction
	lda.b d0
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:									; d0 = A, A = Xvel+1,x, A and $00FF, if $0080 bits clear go to .2, ...
	sta.b d0
	lda.w Xvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + puckx, d2 = A, A = Yvel+1,x, A and $00FF, ...
	clc
	adc.w puckx
	sta.b d2
	lda.w Yvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A + pucky, d3 = A, threat = 0, d4 = $0005, ...
	clc
	adc.w pucky
	sta.b d3
	stz.w threat
	lda.w #$0005
	sta.b d4
	stz.b a0
	cpx.w #$000C
	bcs .loop
	lda.w #$000C
	sta.b a0
.loop:								; loop: Y = a0, A = Xvel+1,y, A and $00FF, ...
	ldy.b a0
	lda.w Xvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:									; A + Xpos,y, A - d2, if A - $FFEB < 0 go to .6, ...
	clc
	adc.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFEB
	bmi .6
	cmp.w #$0015
	bpl .6
	lda.w Yvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .5
	ora.w #$FF00
.5:									; A + Ypos,y, A - d3, if A - $FFEB < 0 go to .6, ...
	clc
	adc.w Ypos,y
	sec
	sbc.b d3
	cmp.w #$FFEB
	bmi .6
	cmp.w #$0015
	bpl .6
	inc.w threat
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	lda.w facedir,x
	eor.w #$0004
	cmp.b d0
	bne .6
	lda.w seed+2
	and.w #$0001
	clc
	adc.b d0
	and.w #$0007
	sta.b d0
.6:									; a0 + 1, a0 + 1, d4 - 1, if the result < 0 go to .rtl, ...
	inc.b a0
	inc.b a0
	dec.b d4
	bmi .rtl
	jmp.w .loop
.rtl:								; return
	rtl
