CheckBump:							; test a burst collision for dislodging the goal and a stoppage penalty
	pei ($7F)
	pei ($83)
	lda.w seed
	and.w #$01C0
	bne .1
	lda.w SPA,x
	cmp.w #SPAburst&$FFFF
	bne .1
	ldy.b a2
	lda.w pucky
	sec
	sbc.w Ypos,y
	cmp.w #$FF80
	bmi .1
	cmp.w #$0080
	bpl .1
	lda.w Xvel,x
	sta.b d0
	lda.w Yvel,x
	sta.b d1
	cmp.w #$DFFF
	bmi .2
	cmp.w #$2001
	bpl .2
	lda.b d0
	cmp.w #$DFFF
	bmi .2
	cmp.w #$2001
	bpl .2
.1:									; pull A, d1 = A, pull A, d0 = A
	pla
	sta.b d1
	pla
	sta.b d0
.rts:								; return
	rts
.2:									; pull A, pull A, A = d0, A / 2, ...
	pla
	pla
	lda.b d0
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .3
	ora.w #$E000
.3:									; d0 = A, A + d0, d0 = A, Y = a2, ...
	sta.b d0
	cmp.w #$8000
	ror a
	clc
	adc.b d0
	sta.b d0
	ldy.b a2
	sta.w Xvel,y
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .4
	ora.w #$E000
.4:									; d1 = A, A + d1, d1 = A, Yvel,y = A, ...
	sta.b d1
	cmp.w #$8000
	ror a
	clc
	adc.b d1
	sta.b d1
	sta.w Yvel,y
	stz.w Xvel,x
	stz.w Yvel,x
	lda.w #$0040
	tsb.w sflags
	lda.w gmclock
	bne .rts
	pla
	lda.w #$0008
	sta.b d0
	jmp.w AddPenalty2
