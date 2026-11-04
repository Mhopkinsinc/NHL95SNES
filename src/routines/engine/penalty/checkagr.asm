checkagr:							; called from other segments
	lda.w #$0014
	sec
	sbc.w aggress,x
	asl a
	asl a
	asl a
	asl a
	sta.b d0
	lda.w playerpad,x
	bmi .1
	asl.b d0
.1:									; A = Xpos,x, A - puckx, if A - $FFD7 < 0 go to .2, ...
	lda.w Xpos,x
	sec
	sbc.w puckx
	cmp.w #$FFD7
	bmi .2
	cmp.w #$0029
	bpl .2
	lda.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi .2
	cmp.w #$0029
	bpl .2
	lsr.b d0
.2:									; go to randomd0
	jml.l randomd0
