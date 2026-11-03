SimPeriodGoals:						; d0 = the goals team d0 scores against team d1 in a period of another
									; game, from both teams' weight rows (sctab by their ratings)
	asl.b d0
	lda.w #$00C3
	sta.b a1+2
	stz.b a1
	ldy.b d0
	lda.b [a1],y
	sta.b a1
	ldy.w #$0006
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$0070
	lsr a
	adc.w #sctab&$FFFF
	sta.b a1
	lda.w #sctab>>16
	sta.b a1+2
	lda.b [a1]
	sta.w nibblebuffer
	ldy.w #$0002
	lda.b [a1],y
	sta.w nibblebuffer+2
	ldy.w #$0004
	lda.b [a1],y
	sta.w nibblebuffer+4
	ldy.w #$0006
	lda.b [a1],y
	sta.w nibblebuffer+6
	asl.b d1
	lda.w #$00C3
	sta.b a1+2
	stz.b a1
	ldy.b d1
	lda.b [a1],y
	sta.b a1
	ldy.w #$0006
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$0007
	asl a
	asl a
	asl a
	adc.w #sctab&$FFFF
	sta.b a1
	lda.w #sctab>>16
	sta.b a1+2
	lda.b [a1]
	adc.w nibblebuffer
	sta.w nibblebuffer
	ldy.w #$0002
	lda.b [a1],y
	adc.w nibblebuffer+2
	sta.w nibblebuffer+2
	ldy.w #$0004
	lda.b [a1],y
	adc.w nibblebuffer+4
	sta.w nibblebuffer+4
	ldy.w #$0006
	lda.b [a1],y
	adc.w nibblebuffer+6
	sta.w nibblebuffer+6
	lda.w #$0004
	sta.b d0
	pei ($85)
	pei ($83)
	pei ($69)
	pei ($67)
	stz.b a1+2
	lda.w #nibblebuffer
	sta.b a1
	stz.b d1
	bra .1
.loop:								; loop: A = d1, A + [a1], d1 = A, a1 + 1, ...
	lda.b d1
	clc
	adc.b [a1]
	sta.b d1
	inc.b a1
	inc.b a1
.1:									; d0 - 1, if the result >= 0 go to .loop, d0 = d1, call randomd0
	dec.b d0
	bpl .loop
	lda.b d1
	sta.b d0
	jsl.l randomd0
.loop2:								; loop: a1 - 1, a1 - 1, A = d0, A - [a1], ...
	dec.b a1
	dec.b a1
	lda.b d0
	sec
	sbc.b [a1]
	sta.b d0
	bpl .loop2
	lda.b a1
	sec
	sbc.w #nibblebuffer
	lsr a
	sta.b d0
	pla
	sta.b a1
	pla
	sta.b a1+2
	pla
	sta.b d1
	pla
	sta.b d1+2
	rtl
