CheckTrade:							; checks the trade: carry clear when it can go; else carry set, X = the
									; team and r3 = the Illegal text (a roster rule broken) or the same team
									; (the trade values differ by 5 or more)
	lda.w #$0077
	sta.b tmp1
	stz.b $77
	lda.b $7B
	sta.b tmp2
	lda.w #ScratchBuf
	sta.b d2
	lda.w #HomeRoster
	sta.b a4
	jsr.w TradeValue
	lda.b d0
	sta.b d5
	lda.b d0+2
	sta.b d5+2
	lda.b d1
	sta.b d6
	lda.w #$0079
	sta.b tmp1
	stz.b $79
	lda.b $7D
	sta.b tmp2
	lda.w #ScratchBuf+$64
	sta.b d2
	lda.w #VisRoster
	sta.b a4
	jsr.w TradeValue
	ldx.w VisTeam
	lda.b $77
	sec
	sbc.b $79
	tay
	bpl .1
	eor.w #$FFFF
	inc a
.1:									; if A < $0005 go to .3, A = Y, if the result >= 0 go to .2, X = HomeTeam
	cmp.w #$0005
	bcc .3
	tya
	bpl .2
	ldx.w HomeTeam
.2:									; r3 = X, return
	stx.b r3
	sec
	rts
.3:									; A = HomeRoster+2, A - d5, A + d0, if A >= $0002 go to .4, ...
	lda.w HomeRoster+2
	sec
	sbc.b d5
	clc
	adc.b d0
	cmp.w #$0002
	bcs .4
	jmp.w .5
.4:									; if A >= $0004 go to .5, r3 = A, A = HomeRoster+4, A - d5+2, ...
	cmp.w #$0004
	bcs .5
	sta.b r3
	lda.w HomeRoster+4
	sec
	sbc.b d5+2
	clc
	adc.b d0+2
	cmp.w #$0009
	bcc .5
	cmp.w #$0010
	bcs .5
	adc.b r3
	sta.b r3
	lda.w HomeRoster+6
	sec
	sbc.b d6
	clc
	adc.b d1
	cmp.w #$0006
	bcc .5
	cmp.w #$0010
	bcs .5
	adc.b r3
	cmp.w #$001A
	bcs .5
	lda.w VisRoster+2
	sec
	sbc.b d0
	clc
	adc.b d5
	cmp.w #$0002
	bcc .6
	cmp.w #$0004
	bcs .6
	sta.b r3
	lda.w VisRoster+4
	sec
	sbc.b d0+2
	clc
	adc.b d5+2
	cmp.w #$0009
	bcc .6
	cmp.w #$0010
	bcs .6
	adc.b r3
	sta.b r3
	lda.w VisRoster+6
	sec
	sbc.b d1
	clc
	adc.b d6
	cmp.w #$0006
	bcc .6
	cmp.w #$0010
	bcs .6
	adc.b r3
	cmp.w #$001A
	bcs .6
	stx.b r3
	clc
	rts
.5:									; X = HomeTeam, go to .7
	ldx.w HomeTeam
	bra .7
.6:									; X = VisTeam
	ldx.w VisTeam
.7:									; r3 = $4B7F, return
	lda.w #$4B7F
	sta.b r3
	sec
	rts
