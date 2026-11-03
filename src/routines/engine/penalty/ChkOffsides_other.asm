ChkOffsides_other:					; from ChkOffsides
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.b d0
	sec
	sbc.w pucky
	bmi .1
	lda.b d0
	sec
	sbc.w OldYpos+$1C
	bpl OffsidesReturn
	bra .2
.1:									; A = d0, A - OldYpos+$1C, if the result < 0 go to OffsidesReturn
	lda.b d0
	sec
	sbc.w OldYpos+$1C
	bmi OffsidesReturn
.2:									; call StartBreakaway, A = gmode, if a $0020 bit set go to .3, ...
	jsl.l StartBreakaway
	lda.w gmode
	bit.w #$0020
	bne .3
	jmp.w OffsidesReturn
.3:									; A = d0, A - $000A, d0 = A, A = gmode, ...
	lda.b d0
	sec
	sbc.w #$000A
	sta.b d0
	lda.w gmode
	bit.w #$0002
	bne .4
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
.4:									; if puckc >= 0 go to .5, A = lastplayer, A * 2
	lda.w puckc
	bpl .5
	lda.w lastplayer
	asl a
.5:									; if A - $000C >= 0 go to .6, if a2 = 0 go to .7, go to OffsidesReturn
	cmp.w #$000C
	bpl .6
	lda.b a2
	beq .7
	bra OffsidesReturn
.6:									; if a2 = 0 go to OffsidesReturn
	lda.b a2
	beq OffsidesReturn
.7:									; d2 = $0005, Y = a2, a0 = tmsort,y
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
.8:									; Y = a0, if position,y < 0 go to .9, A = d0, A - Ypos,y, ...
	ldy.b a0
	lda.w position,y
	bmi .9
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi .9
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
	rtl
.9:									; a0 + 1, a0 + 1, d2 - 1, if the result >= 0 go to .8, ...
	inc.b a0
	inc.b a0
	dec.b d2
	bpl .8
	rtl
