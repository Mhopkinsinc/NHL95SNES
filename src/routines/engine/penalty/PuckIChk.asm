PuckIChk:							; called from other segments
	lda.w iflags
	bit.w #$0004
	beq .rtl
	bit.w #$0001
	bne .rtl
	lda.w puckc
	bpl .rtl
	lda.w #$010E
	sta.b d0
	lda.w iflags
	bit.w #$0002
	bne .1
	lda.w #$FEF2
	sec
	sbc.w pucky
	bpl .2
.rtl:								; return
	rtl
.1:									; A = $010E, A - pucky, if the result >= 0 go to .rtl
	lda.w #$010E
	sec
	sbc.w pucky
	bpl .rtl
.2:									; A = $0001, return
	lda.w #$0001
	tsb.w iflags
	rtl
