SetScore:							; the score of the other game a0 for the ticker: its period stepped and
									; both scores raised from the teams' strengths (SimPeriodGoals), or the
									; game ended
	phx
	ldx.b a0
	lda.w gsper,x
	cmp.w #$0004
	bcc .1
	jmp.w .6
.1:									; X = a0, if gsper,x is not $0003 go to .4, A = $0005
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	ldx.b a0
	lda.w gsper,x
	cmp.w #$0003
	bne .4
	lda.w #$0005
	sta.w gsper,x
	lda.w gss1,x
	sec
	sbc.w gss2,x
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:									; if A >= $0002 go to .5, if gsp is not $0004 go to .3, ...
	cmp.w #$0002
	bcs .5
	lda.w gsp
	cmp.w #$0004
	bne .3
	lda.w gss1,x
	cmp.w gss2,x
	bne .5
	inc a
	sta.w gss1,x
	bra .5
.3:									; gsper,x = $0003, A = gsflags,x, A or $0002, gsflags,x = A, ...
	lda.w #$0003
	sta.w gsper,x
	lda.w gsflags,x
	ora.w #$0002
	sta.w gsflags,x
	bra .5
.4:									; gsper,x + 1, d0 = gst1,x, d1 = gst2,x, call SimPeriodGoals, ...
	inc.w gsper,x
	lda.w gst1,x
	sta.b d0
	lda.w gst2,x
	sta.b d1
	jsl.l SimPeriodGoals
	ldx.b a0
	lda.w gss1,x
	clc
	adc.b d0
	sta.w gss1,x
	lda.w gst2,x
	sta.b d0
	lda.w gst1,x
	sta.b d1
	jsl.l SimPeriodGoals
	ldx.b a0
	lda.w gss2,x
	clc
	adc.b d0
	sta.w gss2,x
.5:									; pull A, a1+2 = A, pull A, a1 = A, ...
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
.6:									; pull X, return
	plx
	rtl
