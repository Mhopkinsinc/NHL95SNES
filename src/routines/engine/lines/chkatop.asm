chkatop:							; from updatepentime and other segments
	stz.b d1
	lda.w pucky
	sec
	sbc.w #$005C
	bpl .1
	inc.b d1
	inc.b d1
	lda.w pucky
	sec
	sbc.w #$FFA4
	bpl .rtl
.1:									; A = gmode, if $0002 bits clear go to .2, A = d1, A xor $0002, ...
	lda.w gmode
	bit.w #$0002
	beq .2
	lda.b d1
	eor.w #$0002
	sta.b d1
.2:									; Y = d1, A = tmATOP,y, A + 1, tmATOP,y = A
	ldy.b d1
	lda.w tmATOP,y
	inc a
	sta.w tmATOP,y
.rtl:								; return
	rtl
