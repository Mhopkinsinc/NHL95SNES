RankScoutingHotColdPlayers:			; ranks a roster's three hottest and coldest players and sums rating
									; changes
	stz.w mesarea
	stz.w mesarea+2
	stz.w mesarea+4
	lda.w #$FFFF
	sta.w mesarea+6
	sta.w mesarea+8
	sta.w mesarea+10
	inc a
	sta.w $000C,y
	lda.w $0000,x
	sta.b a0
	lda.w #$0000
.1:									; push X, push A, push Y, d4 = $5DF9, ...
	phx
	pha
	phy
	ldy.w #$5DF9
	sty.b d4
	ldy.w #$0000
	cmp.w $0002,x
	bcs .2
	ldy.w #$F0C9
	sty.b d4
	ldy.w #$0010
.2:									; d4+2 = Y, d0 = A, RatingMode = 0, call CalcRosterAttribLong, ...
	sty.b d4+2
	sta.b d0
	stz.w RatingMode
	jsl.l CalcRosterAttribLong
	pha
	lda.b $05,s
	sta.b d0
	inc.w RatingMode
	jsl.l CalcRosterAttribLong
	sec
	sbc.b $01,s
	plx
	sta.b a0+2
	ply
	plx
	bit.w #$8000
	bne .6
	cmp.w mesarea+4
	bcs .3
	jmp.w .10
.3:									; if A >= $04F7 go to .4, $04F9 = A, A = X, A * 2, ...
	cmp.w mesarea+2
	bcs .4
	sta.w mesarea+4
	txa
	asl a
	sta.w $0004,y
	jmp.w .10
.4:									; mesarea+4 = mesarea+2, $0004,y = $0002,y, ...
	lda.w mesarea+2
	sta.w mesarea+4
	lda.w $0002,y
	sta.w $0004,y
	lda.b a0+2
	cmp.w mesarea
	bcs .5
	sta.w mesarea+2
	txa
	asl a
	sta.w $0002,y
	bra .10
.5:									; mesarea+2 = mesarea, $0002,y = $0000,y, mesarea = a0+2, A = X, ...
	lda.w mesarea
	sta.w mesarea+2
	lda.w $0000,y
	sta.w $0002,y
	lda.b a0+2
	sta.w mesarea
	txa
	asl a
	sta.w $0000,y
	bra .10
.6:									; if A = $04FF go to .7, if carry set go to .10
	cmp.w mesarea+10
	beq .7
	bcs .10
.7:									; if A < $04FD go to .8, if zero go to .8, $04FF = A, A = X, ...
	cmp.w mesarea+8
	bcc .8
	beq .8
	sta.w mesarea+10
	txa
	asl a
	sta.w $000A,y
	bra .10
.8:									; mesarea+10 = mesarea+8, $000A,y = $0008,y, ...
	lda.w mesarea+8
	sta.w mesarea+10
	lda.w $0008,y
	sta.w $000A,y
	lda.b a0+2
	cmp.w mesarea+6
	bcc .9
	beq .9
	sta.w mesarea+8
	txa
	asl a
	sta.w $0008,y
	bra .10
.9:									; mesarea+8 = mesarea+6, $0008,y = $0006,y, mesarea+6 = a0+2, A = X, ...
	lda.w mesarea+6
	sta.w mesarea+8
	lda.w $0006,y
	sta.w $0008,y
	lda.b a0+2
	sta.w mesarea+6
	txa
	asl a
	sta.w $0006,y
.10:								; A = $000C,y, A + a0+2, $000C,y = A, A = X, ...
	lda.w $000C,y
	clc
	adc.b a0+2
	sta.w $000C,y
	txa
	plx
	inc a
	cmp.b a0
	beq .rts
	jmp.w .1
.rts:								; return
	rts
