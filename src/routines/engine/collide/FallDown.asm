FallDown:							; player a2 falls or stumbles from a hit: the crowd excitement + 15, then
									; the fall or stumble animation by the hit
	lda.w CwdExciteLvl
	clc
	adc.w #$000F
	bmi .1
	sta.w CwdExciteLvl
.1:									; if a2 >= $0018 go to .rtl, if SPA,y = SPAinjury1&$FFFF go to .rtl, ...
	ldy.b a2
	cpy.w #$0018
	bcs .rtl
	lda.w SPA,y
	cmp.w #SPAinjury1&$FFFF
	beq .rtl
	cmp.w #SPAstumble&$FFFF
	beq .rtl
	cmp.w #SPAfallfwd&$FFFF
	beq .rtl
	cmp.w #SPAfallback&$FFFF
	beq .rtl
	cmp.w #SPAflip&$FFFF
	beq .rtl
	lda.w #SPAstumble&$FFFF
	sta.b d1
	lda.w gmclock
	bne .2
	lda.w stickhand,y
	cmp.w #$000C
	bcc .2
	lda.w nopuckb,y
	bne .2
	lda.w seed
	and.w #$000F
	adc.w #$000A
	sta.b d0
	sec
	sbc.w impact,y
	bmi .2
	lda.w #$003C
	sta.w nopuckb,y
	jmp.w .26
.rtl:								; return
	rtl
.2:									; if position,x = 0 go to .4, a0 = 0, if pfteam,x = 0 go to .3, a0 = $0002
	lda.w position,x
	beq .4
	stz.b a0
	lda.w pfteam,x
	beq .3
	lda.w #$0002
	sta.b a0
.3:									; if gmclock is not 0 go to .4, Y = a0, A = tmchecks,y, A + 1, ...
	lda.w gmclock
	bne .4
	ldy.b a0
	lda.w tmchecks,y
	inc a
	sta.w tmchecks,y
.4:									; Y = a2, nopuck,y = $0078, A = Xpos,x, A - Xpos,y, ...
	ldy.b a2
	lda.w #$0078
	sta.w nopuck,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	lda.w Xpos,y
	cmp.w #$007B
	bpl .9
	cmp.w #$FF85
	bmi .12
	lda.w Ypos,y
	cmp.w #$011E
	bpl .7
	cmp.w #$FEE2
	bmi .6
.5:									; go to .24
	jmp.w .24
.6:									; go to .21
	jmp.w .21
.7:									; go to .19
	jmp.w .19
.8:									; go to .39
	jmp.w .39
.9:									; if Ypos,y - $00F0 >= 0 go to .8, if Ypos,y - $FF0A < 0 go to .8, ...
	lda.w Ypos,y
	cmp.w #$00F0
	bpl .8
	cmp.w #$FF0A
	bmi .8
	lda.b d0
	cmp.w #$0005
	bcc .5
	lda.w #$008F
	sta.w Xpos,y
	lda.w #$0000
	sta.w Xvel,y
.10:								; A = attribute,y, if a $0800 bit set go to .14
	lda.w attribute,y
	bit.w #$0800
	bne .14
.11:								; A = SPAboardright&$FFFF, go to .15
	lda.w #SPAboardright&$FFFF
	bra .15
.12:								; if Ypos,y - $00F0 >= 0 go to .8, if Ypos,y - $FF0A < 0 go to .8, ...
	lda.w Ypos,y
	cmp.w #$00F0
	bpl .8
	cmp.w #$FF0A
	bmi .8
	lda.b d0
	dec a
	cmp.w #$0003
	bcs .5
	lda.w #$FF71
	sta.w Xpos,y
	lda.w #$0000
	sta.w Xvel,y
	lda.w Ypos,y
	cmp.w #$006C
	bpl .13
	cmp.w #$FF94
	bpl .18
.13:								; A = attribute,y, if a $0800 bit set go to .11
	lda.w attribute,y
	bit.w #$0800
	bne .11
.14:								; A = SPAboardleft&$FFFF
	lda.w #SPAboardleft&$FFFF
.15:								; X = a2, pfalock,x = A, call SetSPAUpdate, A = CwdExciteLvl, ...
	ldx.b a2
	sta.w pfalock,x
	jsl.l SetSPAUpdate
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .16
	sta.w CwdExciteLvl
.16:								; benchcheer = 0, Y = a2, if pfteam,y = 0 go to .17, A = $0002
	stz.w benchcheer
	ldy.b a2
	lda.w pfteam,y
	beq .17
	lda.w #$0002
.17:								; A + $0006, call StartBenchCheer, benchrounds = $0002, X = a3, ...
	clc
	adc.w #$0006
	jsl.l StartBenchCheer
	lda.w #$0002
	sta.w benchrounds
	ldx.b a3
	ldy.b a2
	jmp.w .29
.18:								; go to .37
	jmp.w .37
.19:								; if Xpos,y - $0050 >= 0 go to .23, if Xpos,y - $FFB0 < 0 go to .23, ...
	lda.w Xpos,y
	cmp.w #$0050
	bpl .23
	cmp.w #$FFB0
	bmi .23
	lda.b d0
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc .24
	lda.w #$0132
	sta.w Ypos,y
	lda.w #$0000
	sta.w Yvel,y
.20:								; A = SPAboardfront&$FFFF, go to .15
	lda.w #SPAboardfront&$FFFF
	bra .15
.21:								; if Xpos,y - $0050 >= 0 go to .23, if Xpos,y - $FFB0 < 0 go to .23, ...
	lda.w Xpos,y
	cmp.w #$0050
	bpl .23
	cmp.w #$FFB0
	bmi .23
	lda.b d0
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .24
	lda.w #$FECE
	sta.w Ypos,y
	lda.w #$0000
	sta.w Yvel,y
.22:								; A = SPAboardback&$FFFF, go to .15
	lda.w #SPAboardback&$FFFF
	jmp.w .15
.23:								; go to .39
	jmp.w .39
.24:								; Y = a3, if pfteam,y = 0 go to .25, A = $0002
	ldy.b a3
	lda.w pfteam,y
	beq .25
	lda.w #$0002
.25:								; A + 1, A + 1, call StartBenchCheer, benchrounds = $0002, ...
	inc a
	inc a
	jsl.l StartBenchCheer
	lda.w #$0002
	sta.w benchrounds
	lda.w #SPAfallback&$FFFF
	sta.b d1
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcc .26
	lda.w #SPAfallfwd&$FFFF
	sta.b d1
	lda.w facedir,y
	and.w #$0003
	bne .26
	lda.w checking,x
	sec
	sbc.w #$000A
	bmi .26
	cpx.w #$0018
	bcs .26
	lda.w #SPAflip&$FFFF
	sta.b d1
.26:								; X = a2, pfalock,x = $0001, call SetSPA, X = a3, ...
	ldx.b a2
	lda.w #$0001
	sta.w pfalock,x
	jsl.l SetSPA
	ldx.b a3
	lda.w position,x
	bne .29
	cpx.w #$0018
	bcs .29
	bra .29
.27:								; go to CollisionSfx
	jmp.w CollisionSfx
.28:								; go to .34
	jmp.w .34
.29:								; A = Crowdlevel, A + $012C, Crowdlevel = A, crowdhold = $002D, ...
	lda.l Crowdlevel
	clc
	adc.w #$012C
	sta.l Crowdlevel
	lda.w #$002D
	sta.b crowdhold
	lda.w puckc
	sta.b d0
	bmi .27
	cpy.b d0
	bne .27
	lda.w gmode
	bit.w #$0010
	bne .28
	lda.w OptPlayMode
	cmp.w #$0001
	beq .28
	lda.w position,x
	beq .28
	lda.w SPA,y
	cmp.w #SPAfallback&$FFFF
	bne .28
	lda.w facedir,y
	and.w #$0003
	bne .28
	lda.w pflags,y
	bit.w #$4000
	bne .28
	lda.w #$0190
	jsl.l randoma8
	asl a
	ldy.b a2
	sec
	sbc.w impact,y
	bpl .28
	lda.w gmclock
	bne .28
	lda.w position,y
	bmi .34
	beq .34
	lda.w #$FFFF
	sta.w puckc
	stz.w benchcheer
	ldy.b a2
	lda.w pfteam,y
	beq .30
	lda.w #$0002
.30:								; A + $0006, call StartBenchCheer, X = a2, ...
	clc
	adc.w #$0006
	jsl.l StartBenchCheer
	ldx.b a2
	lda.w #SPAinjury1&$FFFF
	sta.w pfalock,x
	jsl.l SetSPAFromA
	ldx.b a3
	lda.w Xvel,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	jsl.l setInjuryType
	lda.w #$0004
	sta.w InjCntDown
	lda.w #$0016
	sta.b d0
	lda.w CwdExciteLvl
	clc
	adc.w #$001E
	bmi .31
	sta.w CwdExciteLvl
.31:								; if position,x is not 0 go to .32, go to AddPenalty2
	lda.w position,x
	bne .32
	jmp.w AddPenalty2
.32:								; if OptPen is not 0 go to .33, go to AddPenalty2
	lda.w OptPen
	bne .33
	jmp.w AddPenalty2
.33:								; d0 = $0014, call AddPenalty2, go to Stop4Pen
	lda.w #$0014
	sta.b d0
	jsl.l AddPenalty2
	jmp.w Stop4Pen
.34:								; Y = a2, if SPA,y = SPAstumble&$FFFF go to .35, puckc = $FFFF
	ldy.b a2
	lda.w SPA,y
	cmp.w #SPAstumble&$FFFF
	beq .35
	lda.w #$FFFF
	sta.w puckc
.35:								; Y = a2, if pfteam,y is not 0 go to .36, A = $0004, call StartSound, ...
	ldy.b a2
	lda.w pfteam,y
	bne .36
	lda.w #$0004
	jsl.l StartSound
	rtl
.36:								; A = Crowdlevel, A + $0258, Crowdlevel = A, crowdhold = $002D, ...
	lda.l Crowdlevel
	clc
	adc.w #$0258
	sta.l Crowdlevel
	lda.w #$002D
	sta.b crowdhold
	rtl
.37:								; A = CwdExciteLvl, A + $000A, if the result < 0 go to .38, ...
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .38
	sta.w CwdExciteLvl
.38:								; X = a2, Xpos,x = $FF65, Xvel,x = 0, A = attribute,x, ...
	ldx.b a2
	lda.w #$FF65
	sta.w Xpos,x
	stz.w Xvel,x
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
	lda.w #SPAbenchcheckr&$FFFF
	sta.w pfalock,x
	jsl.l SetSPAFromA
	ldx.b a3
	ldy.b a2
	jmp.w .29
.39:								; d5 = d0, d2 = Xpos,y, d3 = Ypos,y, X = $0048, ...
	lda.b d0
	sta.b d5
	lda.w Xpos,y
	sta.b d2
	lda.w Ypos,y
	sta.b d3
	ldx.w #$0048
	ldy.w #$00EA
	lda.b d2
	bpl .40
	ldx.w #$FFB8
.40:								; if d3 >= 0 go to .41, Y = $FF16
	lda.b d3
	bpl .41
	ldy.w #$FF16
.41:								; d0+2 = X, d1+2 = Y, A = d2, A - d0+2, ...
	stx.b d0+2
	sty.b d1+2
	lda.b d2
	sec
	sbc.b d0+2
	sta.b d0
	lda.b d3
	sec
	sbc.b d1+2
	sta.b d1
	ldy.b d0
	jsl.l ApproxLength
	ldy.b a2
	sta.b d4
	cmp.w #$0014
	bcs .42
	ldx.b a3
	jmp.w .24
.42:								; A = d0, X = A, A = d4, call DivX8S, ...
	lda.b d0
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	lsr a
	lsr a
	bit.w #$2000
	beq .43
	ora.w #$C000
.43:								; d0 = A, if $8000 bits clear go to .44, A xor $FFFF, A + 1
	sta.b d0
	bit.w #$8000
	beq .44
	eor.w #$FFFF
	inc a
.44:								; d2+2 = A, A = d1, X = A, A = d4, ...
	sta.b d2+2
	lda.b d1
	xba
	tax
	lda.b d4
	jsl.l DivX8S
	ldx.b a3
	lsr a
	lsr a
	bit.w #$2000
	beq .45
	ora.w #$C000
.45:								; d1 = A, if $8000 bits clear go to .46, A xor $FFFF, A + 1
	sta.b d1
	bit.w #$8000
	beq .46
	eor.w #$FFFF
	inc a
.46:								; if A >= d2+2 go to .49, if d0+2 >= 0 go to .48, A = d5, A - 1, ...
	cmp.b d2+2
	bcs .49
	lda.b d0+2
	bpl .48
	lda.b d5
	dec a
	cmp.w #$0003
	bcs .47
	lda.b d0
	clc
	adc.w #$0006
	clc
	adc.b d0+2
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b d1+2
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w .13
.47:								; go to .24
	jmp.w .24
.48:								; if d5 < $0005 go to .47, A = d0, A - $0006, A + d0+2, ...
	lda.b d5
	cmp.w #$0005
	bcc .47
	lda.b d0
	sec
	sbc.w #$0006
	clc
	adc.b d0+2
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b d1+2
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w .10
.49:								; if d1+2 >= 0 go to .50, A = d5, A + 1, A and $0007, ...
	lda.b d1+2
	bpl .50
	lda.b d5
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .47
	lda.b d0
	clc
	adc.b d0+2
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b d1+2
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w .22
.50:								; A = d5, A + 1, A + 1, A and $0007, ...
	lda.b d5
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc .47
	lda.b d0
	clc
	adc.b d0+2
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b d1+2
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w .20
