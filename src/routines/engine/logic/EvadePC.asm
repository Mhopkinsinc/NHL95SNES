EvadePC:							; passed as a long pointer (lda #bank, lda #low) to skateto
	lda.w puckc
	bmi .rtl
	lda.w Xvel+1,x
	sec
	sbc.w puckvx+1
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:									; A + Xpos,x, A - puckx, if A - $FFD7 < 0 go to .rtl, ...
	clc
	adc.w Xpos,x
	sec
	sbc.w puckx
	cmp.w #$FFD7
	bmi .rtl
	cmp.w #$0029
	bpl .rtl
	lda.w Yvel+1,x
	sec
	sbc.w puckvy+1
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + Ypos,x, A - pucky, if A - $FFD7 < 0 go to .rtl, ...
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi .rtl
	cmp.w #$0029
	bpl .rtl
	lda.w Xpos,x
	sec
	sbc.w puckx
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b d1
	jml.l vtoa
.rtl:								; return
	rtl
