assbench:							; asstab entry 12: an assignment routine
	lda.w temp1,x
	cmp.w #$0064
	bne .1
	jmp.w .14
.1:									; call check4bench, A = pflags,x, if $4000 bits clear go to .2, ...
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$4000
	beq .2
	jml.l assexit
.2:									; if $0002 bits clear go to .4, A and $FFFD, pflags,x = A, ...
	bit.w #$0002
	beq .4
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$0050
	sta.b d0
	lda.w pfteam,x
	bne .3
	lda.w #$FFB0
	sta.b d0
.3:									; temp4,x = d0, temp3,x = $FF5D, temp1,x = 0
	lda.b d0
	sta.w temp4,x
	lda.w #$FF5D
	sta.w temp3,x
	stz.w temp1,x
.4:									; if newpnum,x is not pnum,x go to .5, go to .18
	lda.w newpnum,x
	cmp.w pnum,x
	bne .5
	jmp.w .18
.5:									; if position,x is not 0 go to .6, A = goalieflags,x, A or $0003, ...
	lda.w position,x
	bne .6
	lda.w goalieflags,x
	ora.w #$0003
	sta.w goalieflags,x
.6:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .7, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .7
	jmp.w .17
.7:									; A = temp1,x, A + $0008, temp1,x = A, A = Ypos,x, ...
	lda.w temp1,x
	adc.w #$0008
	sta.w temp1,x
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	bit.w #$8000
	beq .8
	eor.w #$FFFF
	inc a
.8:									; if A < $0029 go to .9, go to .17
	cmp.w #$0029
	bcc .9
	jmp.w .17
.9:									; A = Xpos,x, A - temp3,x, d0 = A, A - $0020, ...
	lda.w Xpos,x
	sec
	sbc.w temp3,x
	sta.b d0
	sec
	sbc.w #$0020
	beq .10
	bmi .10
	jmp.w .17
.10:								; A = SPAglide&$FFFF, if position,x is not 0 go to .11, ...
	lda.w #SPAglide&$FFFF
	ldy.w position,x
	bne .11
	lda.w #SPAgready&$FFFF
.11:								; call SetSPAFromA, pfnc,x = $0001, if facedir,x = $0004 go to .12, ...
	jsl.l SetSPAFromA
	lda.w #$0001
	sta.w pfnc,x
	lda.w facedir,x
	cmp.w #$0004
	beq .12
	inc a
	and.w #$0007
	sta.w facedir,x
.12:								; Yvel,x = 0, Xvel,x = $F800, A = d0, A - $0010, ...
	stz.w Yvel,x
	lda.w #$F800
	sta.w Xvel,x
	lda.b d0
	sec
	sbc.w #$0010
	beq .13
	bpl .rtl
.13:								; Xvel,x = 0, if facedir,x is not $0004 go to .rtl, Xpos,x = $FF65, ...
	stz.w Xvel,x
	lda.w facedir,x
	cmp.w #$0004
	bne .rtl
	lda.w #$FF65
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
	lda.w #SPAwallin&$FFFF
	jsl.l SetSPAFromA
	lda.w #$0064
	sta.w temp1,x
	sta.w pfalock,x
.rtl:								; return
	rtl
.14:								; A = pnum,x, A * 2, d0 = A, a0 = 0, ...
	lda.w pnum,x
	asl a
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	beq .15
	lda.w #$0002
	sta.b a0
.15:								; if a0 = 0 go to .16, A = $0034
	lda.b a0
	beq .16
	lda.w #$0034
.16:								; A + d0, Y = A, tmpdst,y = $FFFE, d3 = newpnum,x, ...
	clc
	adc.b d0
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b d3
	jsl.l TakeNewPosition
	jmp.w setplayer
.17:								; if pfnc,x is not 0 go to .rtl, A = pflags,x, ...
	lda.w pfnc,x
	bne .rtl
	lda.w pflags,x
	bit.w #$4008
	bne .rtl
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w #EvadePC>>16
	sta.b a0+2
	lda.w #EvadePC&$FFFF
	sta.b a0
	jml.l skateto
.18:								; A = pflags,x, A and $EFFF, pflags,x = A
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
TakeNewPosition:					; player X takes his requested position (newpos into position, Setplass);
									; newpnum and newpos cleared
	lda.w newpos,x
	sta.b d0
	sta.w position,x
	jsl.l Setplass
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	rtl
