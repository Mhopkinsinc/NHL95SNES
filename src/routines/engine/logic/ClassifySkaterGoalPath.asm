ClassifySkaterGoalPath:				; classify the start and target around the skater goal avoidance box
	stx.b r3
	sty.b $42
	stz.b tmp0
	stz.b tmp1
	ldx.b p0+2
	ldy.b p1+2
	cpx.b r3
	bpl .3
	lda.w #$0008
	sta.b tmp0
	cpy.b r3
	bpl .4
.rts:								; return
	rts
.1:									; if Y - $42 < 0 go to .5, tmp1 = $0002, go to .5
	cpy.b $42
	bmi .5
	lda.w #$0002
	sta.b tmp1
	bra .5
.2:									; if Y - $002C < 0 go to .6, A = tmp1, A or $0004, tmp1 = A, ...
	cpy.w #$002C
	bmi .6
	lda.b tmp1
	ora.w #$0004
	sta.b tmp1
	bra .6
.3:									; if Y - r3 >= 0 go to .4, tmp1 = $0008
	cpy.b r3
	bpl .4
	lda.w #$0008
	sta.b tmp1
.4:									; if X - $42 < 0 go to .1, tmp0 = $0002, if Y - $42 >= 0 go to .rts
	cpx.b $42
	bmi .1
	lda.w #$0002
	sta.b tmp0
	cpy.b $42
	bpl .rts
.5:									; X = p0, Y = p1, if p0 - $002C < 0 go to .2, A = tmp0, ...
	ldx.b p0
	ldy.b p1
	cpx.w #$002C
	bmi .2
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$002C
	bpl .rts
.6:									; if X - $FFD4 >= 0 go to .8, A = tmp0, A or $0010, tmp0 = A, ...
	cpx.w #$FFD4
	bpl .8
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFD4
	bmi .rts
.7:									; tmp2 + 1, return
	inc.b tmp2
	rts
.8:									; if Y - $FFD4 >= 0 go to .7, A = tmp1, A or $0010, tmp1 = A, ...
	cpy.w #$FFD4
	bpl .7
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
