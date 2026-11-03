InitBreakawayPath:					; choose the starting side and waypoint of the breakaway path
	lda.b d0
	cmp.w #$002E
	bpl .6
	jsl.l RandomWord
	and.w #$00C0
	beq .1
	lda.w attribute,x
	bit.w #$0800
	bne .2
	bra .3
.1:									; call RandomWord, A and $00F0, d0 = A, A = $007F, ...
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi .3
.2:									; A = $0033, go to .4
	lda.w #$0033
	bra .4
.3:									; A = $FFCD
	lda.w #$FFCD
.4:									; if pfgoal,x is not 0 go to .5, A xor $FFFF, A + 1
	ldy.w pfgoal,x
	bne .5
	eor.w #$FFFF
	inc a
.5:									; sopathside = A, sopathx = A, sopathy = $0028, sopathnext = $001E, ...
	sta.w sopathside
	sta.w sopathx
	lda.w #$0028
	sta.w sopathy
	lda.w #$001E
	sta.w sopathnext
	rts
.6:									; if Xpos,x - $0020 >= 0 go to .13, if Xpos,x - $FFE0 < 0 go to .13, ...
	lda.w Xpos,x
	cmp.w #$0020
	bpl .13
	cmp.w #$FFE0
	bmi .13
	jsl.l RandomWord
	and.w #$00C0
	beq .7
	lda.w attribute,x
	bit.w #$0800
	bne .8
	bra .9
.7:									; call RandomWord, A and $00F0, d0 = A, A = $007F, ...
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi .9
.8:									; A = $002C, go to .10
	lda.w #$002C
	bra .10
.9:									; A = $FFD4
	lda.w #$FFD4
.10:								; if pfgoal,x is not 0 go to .11, A xor $FFFF, A + 1
	ldy.w pfgoal,x
	bne .11
	eor.w #$FFFF
	inc a
.11:								; sopathside = A, sopathx = A
	sta.w sopathside
	sta.w sopathx
.12:								; sopathpoint = $0002, sopathy = $0097, sopathnext = $008C, return
	lda.w #$0002
	sta.w sopathpoint
	lda.w #$0097
	sta.w sopathy
	lda.w #$008C
	sta.w sopathnext
	rts
.13:								; sopathside = A, sopathx = 0, go to .12
	sta.w sopathside
	stz.w sopathx
	bra .12
