UpdateScores:						; no caller found (not traced)
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	asl a
	sta.b a0
.loop:								; loop: if d1 = gamenum go to .1, X = a0, A = gsflags,x, A and $FFFD, ...
	lda.b d1
	cmp.w gamenum
	beq .1
	ldx.b a0
	lda.w gsflags,x
	and.w #$FFFD
	sta.w gsflags,x
	bit.w #$0004
	bne .1
	jsl.l SetScore
.1:									; a0 - 1, a0 - 1, d1 - 1, if the result >= 0 go to .loop, ...
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loop
	rtl
