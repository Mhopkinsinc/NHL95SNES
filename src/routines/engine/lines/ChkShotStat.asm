ChkShotStat:						; from puckgoalie, Goal and other segments
	lda.w #$1000
	trb.w sflags
	bne .1
	jmp.w .rtl
.1:									; if gmclock = 0 go to .2, go to .rtl
	lda.w gmclock
	beq .2
	jmp.w .rtl
.2:									; push X, a3 = shotplayer, a2 = 0, A = $0002
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($7F)
	pei ($81)
	phx
	ldx.w shotplayer
	stx.b a3
	stz.b a2
	lda.w #$0002
	sta.b a1
	txa
	cmp.w #$000C
	bmi .3
	lda.w #$0002
	sta.b a2
	stz.b a1
.3:									; Y = tmshots, if pfteam,x = 0 go to .4, Y + 1, Y + 1
	ldy.w #tmshots
	lda.w pfteam,x
	beq .4
	iny
	iny
.4:									; A = $0000,y, A + 1, $0000,y = A, if a2 is not 0 go to .6, ...
	lda.w $0000,y
	inc a
	sta.w $0000,y
	ldy.b a2
	bne .6
	lda.w tmap
	sec
	sbc.w tmap+2
	beq .8
	bmi .5
	lda.w tmPPShots
	inc a
	sta.w tmPPShots
	bra .8
.5:									; A = tmSHShots, A + 1, tmSHShots = A, go to .8
	lda.w tmSHShots
	inc a
	sta.w tmSHShots
	bra .8
.6:									; A = tmap+2, A - tmap, if the result = 0 go to .8, if minus go to .7, ...
	lda.w tmap+2
	sec
	sbc.w tmap
	beq .8
	bmi .7
	lda.w tmPPShots+2
	inc a
	sta.w tmPPShots+2
	bra .8
.7:									; A = tmSHShots+2, A + 1, tmSHShots+2 = A
	lda.w tmSHShots+2
	inc a
	sta.w tmSHShots+2
.8:									; A = gsp, A * 2, A * 2, X = A, ...
	lda.w gsp
	asl a
	asl a
	tax
	lda.b a2
	beq .9
	inx
	inx
.9:									; A = tmPerShots,x, A + 1, tmPerShots,x = A, X = a3, ...
	lda.w tmPerShots,x
	inc a
	sta.w tmPerShots,x
	ldx.b a3
	lda.w pnum,x
	sta.b d0
	lda.b a2
	beq .10
	lda.w #$001A
.10:								; A + d0, X = a2, if A = tmgoalie,x go to .11, X = A, ...
	clc
	adc.b d0
	ldx.b a2
	cmp.w tmgoalie,x
	beq .11
	tax
	sep #$20
	inc.w tmpshots,x
	rep #$20
.11:								; X = a1, d0 = tmgoalie,x, if tmgoalie,x < 0 go to .13, ...
	ldx.b a1
	lda.w tmgoalie,x
	sta.b d0
	bmi .13
	lda.b a1
	beq .12
	lda.w #$001A
.12:								; A + d0, X = A, A 8-bit, tmpshots,x + 1, ...
	clc
	adc.b d0
	tax
	sep #$20
	inc.w tmpshots,x
	rep #$20
.13:								; pull X, pull A, d0+2 = A, pull A, ...
	plx
	pla
	sta.b d0+2
	pla
	sta.b d0
	pla
	sta.b a3+2
	pla
	sta.b a3
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b a1+2
	pla
	sta.b a1
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .rtl
	sta.w CwdExciteLvl
.rtl:								; return
	rtl
