chkprogress:						; from PenaltyManager and other segments
	lda.w gmode
	bit.w #$0004
	bne .1
.rtl:								; return
	rtl
.1:									; if PenCntDwn >= 0 go to .2, go to .3
	lda.w PenCntDwn
	bpl .2
	jmp.w .3
.2:									; A - d7, PenCntDwn = A, if plus go to .rtl, A = $0008, ...
	sec
	sbc.b d7
	sta.w PenCntDwn
	bpl .rtl
	lda.w #$0008
	trb.w gmode
	lda.w #PenBuf
	sta.b a0
.loop:								; loop: A = (a0), a0 + 1, a0 + 1, A and $00FF, ...
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	tay
	beq .rtl
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #Penaltylist>>16
	sta.b a1+2
	lda.w #Penaltylist&$FFFF
	sta.b a1
	clc
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq .loop
	cmp.w #$0001
	beq .loop
	lda.w #$0400
	tsb.w sflags
	jsl.l FadeOutWait
	jsl.l SetHor
	lda.w #$0038
	sta.b Hpos
	stz.b Vpos
	jsl.l freezewindow
	lda.w #$FF00
	tsb.w puckc
	ldx.w #$001C
	stx.b a3
	lda.w #$001A
	sta.b d0
	jsl.l assinsert
	ldx.b a3
	lda.w #$1C20
	sta.w temp1,x
	lda.w #$FF00
	tsb.w RefStep
	stz.w RefCnt
	jsl.l UpdatePA
	lda.w #$0032
	sta.w RefCnt
	stz.b d0
	stz.w tmp0
	phx
	jsl.l PushRef
	plx
	stz.w fadein
	rtl
.3:									; call SeatPenaltyBox, if RefCnt < 0 go to .4, go to .rtl2
	jsl.l SeatPenaltyBox
	lda.w RefCnt
	bmi .4
	jmp.w .rtl2
.4:									; if RefStep < 0 go to .5, go to .rtl2
	lda.w RefStep
	bmi .5
	jmp.w .rtl2
.5:									; continue
	pei ($7F)
	pei ($81)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
.6:									; a0 = PenBuf
	lda.w #PenBuf
	sta.b a0
.loop2:								; loop: A = (a0), a0 + 1, a0 + 1, A and $00FF, ...
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop2
	cmp.w #$0000
	bne .loop3
	jmp.w .23
.loop3:								; loop: A = (a0), a0 + 1, a0 + 1, if (a0) is not $0000 go to .loop3, ...
	lda.b (a0)
	inc.b a0
	inc.b a0
	cmp.w #$0000
	bne .loop3
	dec.b a0
	dec.b a0
	dec.b a0
	dec.b a0
	lda.b (a0)
	pha
	and.w #$7FFF
	sta.b (a0)
	pla
	bmi .8
	lda.b (a0)
	xba
	and.w #$00FF
	asl a
	sta.b d1
	tay
	lda.w position,y
	bmi .7
	jmp.w .24
.7:									; (a0) = $0000, go to .24
	lda.w #$0000
	sta.b (a0)
	jmp.w .24
.8:									; A = (a0), A and $00FF, d0 = A, Y = A, ...
	lda.b (a0)
	and.w #$00FF
	sta.b d0
	tay
	lda.w #Penaltylist>>16
	sta.b a1+2
	lda.w #Penaltylist&$FFFF
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	cmp.w #$455B
	bne .9
	jmp.w .20
.9:									; A = [a1], A and $00FF, d2 = A, if not zero go to .10, ...
	lda.b [a1]
	and.w #$00FF
	sta.b d2
	bne .10
	jmp.w .21
.10:								; call GetPeriodTimeRemaining
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($73)
	pei ($75)
	jsl.l GetPeriodTimeRemaining
	lda.b (a0)
	xba
	and.w #$00FF
	asl a
	sta.b d1
	tax
	stx.b a3
	stz.b d0
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pfteam,x
	beq .11
	lda.w #$8000
	sta.b d0
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w CwdExciteLvl
	clc
	adc.w #$0014
	bmi .11
	sta.w CwdExciteLvl
.11:								; Y = a2, A = tmPenalties,y, A + 1, tmPenalties,y = A, ...
	ldy.b a2
	lda.w tmPenalties,y
	inc a
	sta.w tmPenalties,y
	lda.w tmPenmin,y
	clc
	adc.b d2
	sta.w tmPenmin,y
	lda.w pnum,x
	and.w #$00FF
	ora.b d0
	sta.w TempPlOffset
	lda.w pnum,x
	sta.b d0
	lda.b a2
	beq .12
	lda.w #$001A
.12:								; push X, A + d0, X = A, A 8-bit, ...
	phx
	clc
	adc.b d0
	tax
	sep #$20
	lda.w ppenmin,x
	rep #$20
	and.w #$00FF
	clc
	adc.b d2
	sep #$20
	sta.w ppenmin,x
	rep #$20
	plx
	lda.w PenSumLength
	cmp.w #$0041
	bcs .14
	asl a
	asl a
	tay
	jsl.l GetPeriodTimeRemaining
	lda.b d0
	sta.w PenSum,y
	iny
	iny
	lda.w TempPlOffset
	cmp.w #$0080
	bmi .13
	ora.w #$0080
.13:								; A 8-bit, PenSum,y = A, A 16-bit, Y + 1, ...
	sep #$20
	sta.w PenSum,y
	rep #$20
	iny
	lda.b (a0)
	and.w #$00FF
	sep #$20
	sta.w PenSum,y
	rep #$20
	inc.w PenSumLength
.14:								; A = TempPlOffset, A and $00FF, if $0080 bits clear go to .15, A or $FF00
	lda.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq .15
	ora.w #$FF00
.15:								; A * 2, d0 = A, push X, X = $003C, ...
	asl a
	sta.b d0
	phx
	ldx.w #$003C
	lda.b d2
	and.w #$00FF
	jsl.l Mul8U
	ora.w #$2000
	sta.b d2
	plx
	lda.b a2
	beq .16
	lda.w #$0034
.16:								; A + d0, Y = A, if tmpdst,y < 0 go to .17, A and $1000, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi .17
	and.w #$1000
	tsb.b d2
.17:								; tmpdst,y = d2, A = $1000, if a2 = 0 go to .18, A = $001A
	lda.b d2
	sta.w tmpdst,y
	lda.w #$1000
	trb.b d2
	pei ($65)
	pei ($63)
	lda.b a2
	beq .18
	lda.w #$001A
.18:								; a0 = A, d1 = $0018
	sta.b a0
	lda.w #$0018
	sta.b d1
.loop4:								; loop: Y = a0, a0 + 1, A = tmboxlist,y, if a $0080 bit set go to .19, ...
	ldy.b a0
	inc.b a0
	lda.w tmboxlist,y
	bit.w #$0080
	bne .19
	dec.b d1
	bpl .loop4
.19:								; A = d0, A or $FF00, tmboxlist,y = A, pull A, ...
	lda.b d0
	ora.w #$FF00
	sta.w tmboxlist,y
	pla
	sta.b a0
	pla
	sta.b a0+2
	lda.w #$000D
	sta.b d0
	jsl.l assreplace
	pla
	sta.b $75
	pla
	sta.b a4
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
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
	jsl.l SetPA
	jsl.l USBoard
	bra .24
.20:								; call StartPenaltyShot
	jsl.l StartPenaltyShot
.21:								; (a0) = $0000, if sfhormode = 0 go to .22, go to .6
	lda.w #$0000
	sta.b (a0)
	lda.w sfhormode
	beq .22
	jmp.w .6
.22:								; call SetPA, go to .24
	jsl.l SetPA
	bra .24
.23:								; A = $0004, a3 = $001C, d0 = $001B, call assreplace
	lda.w #$0004
	trb.w gmode
	ldx.w #$001C
	stx.b a3
	lda.w #$001B
	sta.b d0
	jsl.l assreplace
.24:								; if OptPlayMode = $0001 go to .25, if penshot is not 0 go to .25, ...
	lda.w OptPlayMode
	cmp.w #$0001
	beq .25
	lda.w penshot
	bne .25
	stz.b a2
	jsl.l InProgress_ap
	lda.w #$0002
	sta.b a2
	jsl.l InProgress_ap
.25:								; pull A, a3+2 = A, pull A, a3 = A, ...
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
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
.rtl2:								; return
	rtl
