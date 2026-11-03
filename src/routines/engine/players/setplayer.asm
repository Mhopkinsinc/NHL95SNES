setplayer:							; from forcepldata and other segments
	phx
	phy
	lda.w pflags,x
	and.w #$FFFB
	sta.w pflags,x
	ldy.w #$0000
	lda.w pfteam,x
	beq .1
	ldy.w #$0002
.1:									; a0 = Y, A = d3, A and $00FF, pnum,x = A, ...
	sty.b a0
	lda.b d3
	and.w #$00FF
	sta.w pnum,x
	asl a
	sta.b d3
	lda.w #$000B
	sta.b d0
	lda.b a0
	beq .2
	lda.w #$0034
.2:									; A + d3, Y = A, d1 = tmpdst,y, A = Y, ...
	adc.b d3
	tay
	lda.w tmpdst,y
	sta.b d1
	tya
	sta.b r3
	asl a
	adc.b r3
	asl a
	sta.b r3
	lda.b d1
	bpl .3
	lda.w #$000A
	sta.b d0
	lda.b d1
	cmp.w #$FFFE
	bne .4
.3:									; call assinsert, pfalock,x = 0, SPA,x = 0
	jsl.l assinsert
	stz.w pfalock,x
	stz.w SPA,x
.4:									; if a0 = 0 go to .5, A = $0034
	lda.b a0
	beq .5
	lda.w #$0034
.5:									; A + d3, Y = A, tmpdst,y = $FFFF, d3 / 2, ...
	clc
	adc.b d3
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b d3
	ldy.w #HomeRoster
	lda.b a0
	beq .6
	ldy.w #VisRoster
.6:									; a0 = Y, PPBonus = 0, PKBonus = 0, ThirdPBonus = 0, ...
	sty.b a0
	stz.w PPBonus
	stz.w PKBonus
	stz.w ThirdPBonus
	stz.w HmAwBonus
	lda.w position,x
	bne .7
	jmp.w .14
.7:									; A = sflags, if $2000 bits clear go to .9, call chkpk2, ...
	lda.w sflags
	bit.w #$2000
	beq .9
	jsl.l chkpk2
	beq .8
	lda.w $0436,y
	sta.w PPBonus
	bra .9
.8:									; PKBonus = $0434,y
	lda.w $0434,y
	sta.w PKBonus
.9:									; HmAwBonus = $043A,y, if pfteam,x is not 0 go to .10, HmAwBonus = $0430,y
	lda.w $043A,y
	sta.w HmAwBonus
	lda.w pfteam,x
	bne .10
	lda.w $0430,y
	sta.w HmAwBonus
.10:								; A = gsp, A - $0002, if the result < 0 go to .14, ...
	lda.w gsp
	sec
	sbc.w #$0002
	bmi .14
	bne .11
	jsl.l GetPeriodTime
	lda.b d0
	lsr a
	sec
	sbc.w gameclock
	beq .11
	bpl .14
.11:								; A = tmscore, A - tmscore+2, tmp0 = A, if zero go to .13, ...
	lda.w tmscore
	sec
	sbc.w tmscore+2
	sta.b tmp0
	beq .13
	lda.w pfteam,x
	beq .12
	lda.w #$0000
	sec
	sbc.b tmp0
	sta.b tmp0
.12:								; if tmp0 >= 0 go to .14
	lda.b tmp0
	bpl .14
.13:								; ThirdPBonus = $0002
	lda.w #$0002
	sta.w ThirdPBonus
.14:								; A = d3, A / 2, A / 2, A / 2, ...
	lda.b d3
	xba
	lsr a
	lsr a
	lsr a
	adc.b a0
	tay
	lda.w $0110,y
	and.w #$007F
	phx
	tax
	lda.l BCDTable,x
	and.w #$00FF
	plx
	sta.w rostnum,x
	lda.w $0111,y
	and.w #$00F0
	lsr a
	sta.w weight,x
	sty.b a0
	lda.w $0111,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	ldy.w #$0000
	jsr.w HotColdRating
	sta.w legstr,x
	ldy.b a0
	lda.w $0112,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	ldy.w #$0001
	jsr.w HotColdRating
	sta.w legspd,x
	ldy.b a0
	lda.w $0112,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	clc
	adc.w ThirdPBonus
	ldy.w #$0002
	jsr.w HotColdRating
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w aioff,x
	ldy.b a0
	lda.w $0113,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w HmAwBonus
	ldy.w #$0003
	jsr.w HotColdRating
	pha
	lda.w position,x
	beq .15
	pla
	eor.w #$000F
	clc
	adc.w #$0007
	sta.w aidef,x
	bra .16
.15:								; pull A, A xor $000F, A + $000F, A / 2, ...
	pla
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w aidef,x
.16:								; Y = a0, A = $0113,y, A and $0007, r0 = A, ...
	ldy.b a0
	lda.w $0113,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	ldy.w #$0004
	jsr.w HotColdRating
	sta.w shotspd,x
	ldy.b a0
	lda.w $0114,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w ThirdPBonus
	ldy.w #$0005
	jsr.w HotColdRating
	sta.w checking,x
	ldy.b a0
	lda.w $0114,y
	and.w #$0001
	eor.w #$0001
	sta.w handed,x
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
	lda.w $0114,y
	and.w #$000E
	sta.w fighting,x
	lda.w $0115,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0006
	jsr.w HotColdRating
	sta.w stickhand,x
	ldy.b a0
	lda.w $0115,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0007
	jsr.w HotColdRating
	sta.w shotacc,x
	ldy.b a0
	lda.w $0116,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	ldy.w #$0008
	jsr.w HotColdRating
	sta.w endurance,x
	ldy.b a0
	lda.w $0116,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w ThirdPBonus
	clc
	adc.w ThirdPBonus
	ldy.w #$0009
	jsr.w HotColdRating
	sta.w spodds,x
	ldy.b a0
	lda.w $0117,y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w HmAwBonus
	ldy.w #$000A
	jsr.w HotColdRating
	sta.w passacc,x
	ldy.b a0
	lda.w $0117,y
	and.w #$0007
	sta.b r0
	asl a
	asl a
	adc.b r0
	lsr a
	ldy.w #$000B
	jsr.w HotColdRating
	sta.w aggress,x
	txy
	lda.w weight,x
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0020
	clc
	adc.w legstr,x
	sta.b r3
	lda.w legstr,x
	lsr a
	adc.b r3
	sta.b r3
	lda.w position,x
	bne .17
	lda.w legstr,x
	asl a
	adc.b r3
	adc.w #$0008
	sta.b r3
.17:								; A = r3, X = $0007, call Mul8U, A * 2, ...
	lda.b r3
	ldx.w #$0007
	jsl.l Mul8U
	asl a
	sta.w AccelStraight,y
	lda.b r3
	ldx.w #$0004
	jsl.l Mul8U
	asl a
	sta.w AccelDiagonal,y
	ply
	plx
	rtl
