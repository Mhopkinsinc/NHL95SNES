PenShotChk:							; called from other segments
	lda.w gmode
	bit.w #$0010
	bne .3
	lda.b a2
	cmp.w puckc
	bne .3
	lda.w breakaway
	bne .1
	jmp.w .3
.1:									; call CheckBreakaway, breakaway = IsBreakaway, ...
	jsl.l CheckBreakaway
	lda.w IsBreakaway
	sta.w breakaway
	bne .2
	jmp.w .3
.2:									; A = $FFFF, go to .rtl
	lda.w #$FFFF
	bra .rtl
.3:									; A = $0000
	lda.w #$0000
.rtl:								; return
	rtl
