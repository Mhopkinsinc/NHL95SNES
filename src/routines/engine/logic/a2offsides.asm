a2offsides:							; from a2touchpuck and other segments
	ldy.b a2
	lda.w gmode
	bit.w #$0020
	beq .rtl
	lda.w pucky
	sta.b d0
	lda.w pfgoal,y
	bne .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:									; if d0 - $005C < 0 go to .rtl, a0 = 0, if pfteam,y = 0 go to .2, ...
	lda.b d0
	cmp.w #$005C
	bmi .rtl
	stz.b a0
	lda.w pfteam,y
	beq .2
	lda.w #$0002
	sta.b a0
.2:									; Y = a0, A = tmflags,y, if $0010 bits clear go to .rtl, A = gmode, ...
	ldy.b a0
	lda.w tmflags,y
	bit.w #$0010
	beq .rtl
	lda.w gmode
	bit.w #$0010
	bne .rtl
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$0012
	sta.b d0
	jsl.l AddPenalty
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
.rtl:								; return
	rtl
