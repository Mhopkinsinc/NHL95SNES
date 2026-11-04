NewTicker2:							; the score ticker's next game: TickerNum counted down, skipping the
									; user's game and games with flag bits $0006, then its box shown
	lda.w TickerNum
	sta.b d3
	bmi .rtl
	dec.w TickerNum
	lda.b d3
	cmp.w gamenum
	beq NewTicker2
	bra .1
.rtl:								; return
	rtl
.1:									; A = d3, A * 2, a0 = A, X = A, ...
	lda.b d3
	asl a
	sta.b a0
	tax
	lda.w gsflags,x
	bit.w #$0006
	bne NewTicker2
	lda.w sflags
	bit.w #$0001
	bne .2
.2:									; A = printy, A - $0005, printy = A, d0 = $001C, ...
	lda.w printy
	sec
	sbc.w #$0005
	sta.w printy
	lda.w #$001C
	sta.b d0
	lda.w #$0005
	sta.b d1
	lda.b Vcount
	sta.w tickervc
	inc.w printx
	lda.w printy
	sec
	sbc.w #$0004
	sta.w printy
	lda.w printx
	pha
	jsl.l GetShifter
	lda.w #$2400
	sta.w printa
	lda.b $01,s
	sta.w printx
	lda.w playoffRoundIdx
	inc a
	sta.b d0
	lda.w OptPlayMode
	bne .3
	stz.b d0
.3:									; pull A, return
	pla
	rtl
