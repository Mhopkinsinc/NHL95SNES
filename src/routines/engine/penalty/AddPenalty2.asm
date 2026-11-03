AddPenalty2:						; from AddPenalty and other segments
	lda.w sfhormode
	beq .1
	jmp.w .rtl
.1:									; if d0 is not $000E go to .2
	pei ($83)
	pei ($85)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	lda.b d0
	cmp.w #$000E
	bne .2
.2:									; A - $000E, if the result < 0 go to .4, A = Crowdlevel, A + $00C8, ...
	sec
	sbc.w #$000E
	bmi .4
	lda.l Crowdlevel
	clc
	adc.w #$00C8
	sta.l Crowdlevel
	lda.w #$002D
	sta.b crowdhold
	lda.w pfteam,x
	beq .4
	lda.l Crowdlevel
	sec
	sbc.w #$00C8
	bcs .3
	lda.w #$0000
.3:									; Crowdlevel = A
	sta.l Crowdlevel
.4:									; a1 = PenBuf, d1 = $001F
	lda.w #PenBuf
	sta.b a1
	lda.w #$001F
	sta.b d1
.loop:								; loop: A = (a1), a1 + 1, a1 + 1, A and $00FF, ...
	lda.b (a1)
	inc.b a1
	inc.b a1
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	tay
	beq .5
	dec.b d1
	bpl .loop
	bra .6
.5:									; a1 - 1, a1 - 1, A = X, A / 2, ...
	dec.b a1
	dec.b a1
	txa
	lsr a
	xba
	and.w #$FF00
	ora.b d0
	sta.b (a1)
	lda.w #Penaltylist>>16
	sta.b a0+2
	lda.w #Penaltylist&$FFFF
	sta.b a0
	ldy.b d0
	clc
	adc.b [a0],y
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	beq .6
	lda.w pflags,x
	pha
	ora.w #$4000
	sta.w pflags,x
	pla
	bit.w #$4000
	beq .6
	lda.w #$0000
	sta.b (a1)
.6:									; pull A, a1+2 = A, pull A, a1 = A, ...
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
.rtl:								; return
	rtl
