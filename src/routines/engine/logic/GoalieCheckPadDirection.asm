GoalieCheckPadDirection:			; check manual goalie direction and stop when no direction is pressed
	lda.w goalieflags,x
	bit.w #$0001
	bne GoalieUpdateStateJump
	bit.w #$0002
	bne GoalieReturnToCrease
	ldy.w playerpad,x
	lda.w paddir,y
	cmp.w #$0008
	bne GoalieUpdateState
	jsl.l stopna
GoalieUpdateState:					; update goalie animation, puck holding, saves and computer movement
	lda.w pf2aip,x
	bne .1
	lda.w #SPAgready&$FFFF
	jsl.l SetSPAFromA
.1:									; if gmclock is not 0 go to .rtl, if temp5,x < 0 go to .4, ...
	lda.w gmclock
	bne .rtl
	lda.w temp5,x
	bmi .4
	cpx.w puckc
	bne .2
	lda.w Ypos,x
	cmp.w #$00BB
	bpl .3
	cmp.w #$FF45
	bmi .3
	stz.w temp5,x
	bra .3
.2:									; temp5,x = $FFFF, go to .4
	lda.w #$FFFF
	sta.w temp5,x
	bra .4
.rtl:								; return
	rtl
.3:									; A = temp5,x, A - d7, temp5,x = A, if plus go to .4, ...
	lda.w temp5,x
	sec
	sbc.b d7
	sta.w temp5,x
	bpl .4
	lda.w #$0008
	sta.b d0
	jsl.l AddPenalty2
.4:									; if pf2aip,x = 0 go to .5, go to .rtl
	lda.w pf2aip,x
	beq .5
	jmp.w .rtl
.5:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .6, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .6
	jmp.w .90
.6:									; A = aidef,x, A / 2, A + temp1,x, if A - $0000 >= 0 go to .7, ...
	lda.w aidef,x
	lsr a
	clc
	adc.w temp1,x
	cmp.w #$0000
	bpl .7
	lda.w #$0000
.7:									; temp1,x = A, if playerpad,x >= 0 go to .11, d0 = pucky, A = Ypos,x, ...
	sta.w temp1,x
	lda.w playerpad,x
	bpl .11
	lda.w pucky
	sta.b d0
	lda.w Ypos,x
	eor.b d0
	sta.b d1
	bpl .9
	stz.b d0
	lda.w #$00FA
	sta.b d2
	lda.w pfgoal,x
	beq .8
	lda.w #$FF06
	sta.b d2
.8:									; go to .78
	jmp.w .78
.9:									; temp4,x - 1, if the result >= 0 go to .10, temp4,x = $FFFF
	dec.w temp4,x
	bpl .10
	lda.w #$FFFF
	sta.w temp4,x
.10:								; if X = puckc go to .12
	cpx.w puckc
	beq .12
.11:								; go to .19
	jmp.w .19
.12:								; if temp5,x >= 0 go to .13, temp5,x = $005A
	lda.w temp5,x
	bpl .13
	lda.w #$005A
	sta.w temp5,x
.13:								; temp4,x = $FFFF, A = temp5,x, A - $005A, ...
	lda.w #$FFFF
	sta.w temp4,x
	lda.w temp5,x
	sec
	sbc.w #$005A
	bpl .15
	jsl.l RandomWord
	cmp.w #$C000
	bcc .15
	lda.w #$0005
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	bne .loop
	lda.w #$000C
	sta.b a0
.loop:								; loop: Y = a0, A = pflags,y, if a $1000 bit set go to .14, ...
	ldy.b a0
	lda.w pflags,y
	bit.w #$1000
	bne .14
	lda.w puckdist,y
	cmp.w #$0023
	bcc .16
.14:								; a0 + 1, a0 + 1, d0 - 1, if the result >= 0 go to .loop, ...
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .loop
	lda.w #$0001
	sta.w threat
	jsl.l chk4pass
	lda.w puckc
	bmi .rtl2
.15:								; go to .28
	jmp.w .28
.16:								; Y = $0000, if A >= $0014 go to .15, pf2aip,x = $005A, ...
	ldy.w #$0000
	cmp.w #$0014
	bcs .15
	lda.w #$005A
	sta.w pf2aip,x
	lda.w #SPAgcover&$FFFF
	jsl.l SetSPAFromA
.rtl2:								; return
	rtl
.17:								; call vtoa, A = d0
	jsl.l vtoa
	lda.b d0
.18:								; facedir,x = A, pfalock,x = A, A = SPAgpoke&$FFFF, call SetSPAFromA, ...
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAgpoke&$FFFF
	jsl.l SetSPAFromA
	lda.w #$00F0
	sta.w goaliedivewait,x
	rtl
.19:								; if playerpad,x < 0 go to .22, ...
	ldy.w playerpad,x
	bmi .22
	lda.w padinputdone,y
	cmp.w #$0001
	bne .22
	cpx.w puckc
	beq .15
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w PadRaw1,y
	bit.w #$4000
	bne .20
	lda.w padnew1,y
	bit.w #$0040
	beq .15
	lda.w paddir,y
	cmp.w #$0008
	beq .17
	and.w #$0007
	bra .18
.20:								; if paddir,y is not $0008 go to .21, go to .25
	lda.w paddir,y
	cmp.w #$0008
	bne .21
	jmp.w .25
.21:								; A and $0007, go to .26
	and.w #$0007
	jmp.w .26
.22:								; A = puckx, A - Xpos,x, d0 = A, A = pucky, ...
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w puckc
	bmi .23
	lsr a
	tay
	lda.w pfteam,y
	cmp.w pfteam,x
	beq .24
	lda.w goaliedivewait,x
	bne .24
	jsl.l RandomWord
	cmp.w #$0A00
	bcs .24
	lda.w puckdist,x
	cmp.w #$0023
	bcs .28
	lda.w pucky
	cmp.w #$FEF1
	bmi .28
	cmp.w #$010F
	bpl .28
	jmp.w .17
.23:								; if temp4,x is not 0 go to .24, if puckdist,x >= $002D go to .28, ...
	lda.w temp4,x
	bne .24
	lda.w puckdist,x
	cmp.w #$002D
	bcs .28
	lda.w pucky
	cmp.w #$FEF1
	bmi .28
	cmp.w #$010F
	bpl .28
	lda.b a2
	eor.w #$0002
	tay
	lda.w tmnear,y
	cmp.w #$003C
	bcs .28
	jsl.l RandomWord
	cmp.w #$0800
	bcs .28
	bra .25
.24:								; go to .28
	jmp.w .28
.25:								; call vtoa, A = d0
	jsl.l vtoa
	lda.b d0
.26:								; facedir,x = A, Y = SPAgdive&$FFFF, A = Y, call SetSPAFromA, ...
	sta.w facedir,x
	ldy.w #SPAgdive&$FFFF
	tya
	jsl.l SetSPAFromA
	lda.w #$0168
	sta.w goaliedivewait,x
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .27
	sta.w CwdExciteLvl
.27:								; pfalock,x = $0096, Crowdlevel + A, crowdhold = $001E, ...
	lda.w #$0096
	sta.w pfalock,x
	clc
	adc.l Crowdlevel
	sta.l Crowdlevel
	lda.w #$001E
	sta.b crowdhold
	rtl
.28:								; if pfgoal,x is not 0 go to .29, a0+2 = 0, a0 = $07D8, d3 = $010A, ...
	lda.w pfgoal,x
	bne .29
	stz.b a0+2
	lda.w #$07D8
	sta.b a0
	lda.w #$010A
	sta.b d3
	lda.w #$010E
	sta.b d4
	bra .30
.29:								; a0 = $07DC, d3 = $FEF6, d4 = $FEF2
	lda.w #$07DC
	sta.b a0
	lda.w #$FEF6
	sta.b d3
	lda.w #$FEF2
	sta.b d4
.30:								; if X = puckc go to .31, call GoaliePuckVector, call vtoa, ...
	cpx.w puckc
	beq .31
	jsr.w GoaliePuckVector
	jsl.l vtoa
	jsl.l AdjustFacingDirection
	bra .32
.31:								; if playerpad,x >= 0 go to .32, A = pfgoal,x, A xor $0001, A * 2, ...
	lda.w playerpad,x
	bpl .32
	lda.w pfgoal,x
	eor.w #$0001
	asl a
	asl a
	sta.b d0
	jsl.l AdjustFacingDirection
.32:								; if Ypos,x - $FEF5 < 0 go to .34, if Ypos,x - $010B >= 0 go to .34
	lda.w Ypos,x
	cmp.w #$FEF5
	bmi .34
	cmp.w #$010B
	bpl .34
.33:								; d0 = puckx, d1 = pucky, call ClampGoalieTargetY, ...
	lda.w puckx
	sta.b d0
	lda.w pucky
	sta.b d1
	jsl.l ClampGoalieTargetY
	lda.b d1
	cmp.w #$FFD2
	bmi .36
	cmp.w #$002E
	bpl .36
	pei ($83)
	pei ($7F)
	jmp.w .47
.34:								; if playerpad,x >= 0 go to .33, d2 = 0, d0 = 0, ...
	lda.w playerpad,x
	bpl .33
	stz.b d2
	stz.b d0
	lda.w Xpos,x
	cmp.w #$FFD3
	bmi .35
	cmp.w #$002D
	bpl .35
	lda.w #$009B
	sta.b d0
	lda.w Xpos,x
	bpl .35
	lda.w #$FF65
	sta.b d0
.35:								; go to .78
	jmp.w .78
.36:								; A = puckvy, A / 2, A and $007F, if $0040 bits clear go to .37, ...
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .37
	ora.w #$FF80
.37:								; r3 = A, A + r3, A + pucky, d1 = A, ...
	sta.b r3
	cmp.w #$8000
	ror a
	adc.b r3
	clc
	adc.w pucky
	sta.b d1
	lda.b d1
	cmp.w #$00E6
	bpl .38
	lda.b d1
	cmp.w #$FF1A
	bpl .43
.38:								; if passReceiverPlayerNum >= 0 go to .41, if puckc < 0 go to .41, ...
	lda.w passReceiverPlayerNum
	bpl .41
	lda.w puckc
	bmi .41
	lda.w seed
	and.w #$0180
	beq .44
.39:								; A = puckvx, A and $00FF, if $0080 bits clear go to .40, A or $FF00
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .40
	ora.w #$FF00
.40:								; r3 = A, A + r3, A + puckx, d0 = A, ...
	sta.b r3
	cmp.w #$8000
	ror a
	adc.b r3
	clc
	adc.w puckx
	sta.b d0
	bra .46
.41:								; A = puckvx, A / 2, A and $007F, if $0040 bits clear go to .42, ...
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .42
	ora.w #$FF80
.42:								; A + puckx, d0 = A, go to .46
	clc
	adc.w puckx
	sta.b d0
	bra .46
.43:								; A = seed, if the result = 0 go to .39
	lda.w seed
	and.w #$0380
	beq .39
.44:								; A = puckvx, A and $00FF, if $0080 bits clear go to .45, A or $FF00
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .45
	ora.w #$FF00
.45:								; A + puckx, d0 = A
	clc
	adc.w puckx
	sta.b d0
.46:								; call ClampGoalieTargetY
	jsl.l ClampGoalieTargetY
	pei ($83)
	pei ($7F)
.47:								; A = d0, Y = d1, call ApproxLength, d0 = A, ...
	lda.b d0
	ldy.b d1
	jsl.l ApproxLength
	sta.b d0
	cmp.w #$001E
	bcs .48
	pla
	sta.b d0
	pla
	sta.b d1
	bra .50
.48:								; A = d0, A + 1, d2 = A, d4 = $0014, ...
	lda.b d0
	inc a
	sta.b d2
	lda.w #$0014
	sta.b d4
	lda.w sflags
	bit.w #$0008
	beq .49
	lda.w #$001C
	sta.b d4
.49:								; pull A, d0 = A, pull A, d1 = A, ...
	pla
	sta.b d0
	pla
	sta.b d1
	tax
	lda.b d4
	jsl.l Mul16x8XS
	lda.b d2
	sta.b r1
	jsl.l Div32S
	lda.b r0
	sta.b d1
	lda.b d4
	adc.w #$0006
	sta.b d4
	ldx.b d0
	jsl.l Mul16x8XS
	lda.b d2
	sta.b r1
	jsl.l Div32S
	lda.b r0
	sta.b d0
	ldx.b curobj
.50:								; A = d1, A + d3, d1 = A, d2 = A, ...
	lda.b d1
	clc
	adc.b d3
	sta.b d1
	sta.b d2
	ldy.w playerpad,x
	bmi .52
	cpx.w puckc
	beq .51
	lda.w PadRaw1,y
	bit.w #$0080
	bne .56
.51:								; go to .76
	jmp.w .76
.52:								; Y = $0002, if [a0],y < $0023 go to .53, go to .78
	ldy.w #$0002
	lda.b [a0],y
	cmp.w #$0023
	bcc .53
	jmp.w .78
.53:								; if [a0] - $FFE7 < 0 go to .55, if [a0] - $0019 >= 0 go to .55, ...
	lda.b [a0]
	cmp.w #$FFE7
	bmi .55
	cmp.w #$0019
	bpl .55
	lda.b [a0],y
	cmp.w #$0013
	bcs .54
	lda.w pucky
	cmp.w #$FEF1
	bmi .54
	cmp.w #$010F
	bmi .56
.54:								; go to .76
	jmp.w .76
.55:								; go to .93
	jmp.w .93
.56:								; Xvel,x = A, Yvel,x = A, A = goalieflags,x, ...
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	lda.w goalieflags,x
	bit.w #$0002
	beq .57
	jmp.w .71
.57:								; A = puckvx, A / 2, A / 2, A and $003F, ...
	lda.w puckvx
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq .58
	ora.w #$FFC0
.58:								; A + puckx, A - Xpos,x, d0 = A, r0+2 = A, ...
	clc
	adc.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	sta.b r0+2
	bit.w #$8000
	beq .59
	eor.w #$FFFF
	inc a
.59:								; r0 = A, A = puckvy, A / 2, A / 2, ...
	sta.b r0
	lda.w puckvy
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq .60
	ora.w #$FFC0
.60:								; A + pucky, A - Ypos,x, d1 = A, if $8000 bits clear go to .61, ...
	clc
	adc.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bit.w #$8000
	beq .61
	eor.w #$FFFF
	inc a
.61:								; r1 = A, call vtoa, if d0 = $0008 go to .63, A - facedir,x, ...
	sta.b r1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	beq .63
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq .63
	jmp.w .72
.62:								; if puckvy - $0800 >= 0 go to .63, if puckvy - $F800 < 0 go to .63, ...
	lda.w puckvy
	cmp.w #$0800
	bpl .63
	cmp.w #$F800
	bmi .63
	lda.w #$0008
	sta.b d0
	jmp.w .75
.63:								; if facedir,x = 0 go to .64, if facedir,x = $0004 go to .66, ...
	lda.w facedir,x
	beq .64
	cmp.w #$0004
	beq .66
	cmp.w #$0001
	beq .68
	cmp.w #$0005
	beq .68
	cmp.w #$0007
	beq .69
	cmp.w #$0003
	beq .69
	lda.w seed
	and.w #$0001
	bra .72
.64:								; if r0+2 >= 0 go to .67
	lda.b r0+2
	bpl .67
.65:								; A = $0007, go to .72
	lda.w #$0007
	bra .72
.66:								; if r0+2 >= 0 go to .65
	lda.b r0+2
	bpl .65
.67:								; A = $0001, go to .72
	lda.w #$0001
	bra .72
.68:								; if r0 - r1 >= 0 go to .67, go to .65
	lda.b r0
	cmp.b r1
	bpl .67
	bra .65
.69:								; if r1 - r0 >= 0 go to .67, go to .65
	lda.b r1
	cmp.b r0
	bpl .67
	bra .65
.70:								; A = d0, A + $0006, d0 = A, go to .75
	lda.b d0
	clc
	adc.w #$0006
	sta.b d0
	jmp.w .75
.71:								; A = puckdir,x, A - facedir,x, A and $0007, d3 = A, ...
	lda.w puckdir,x
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq .63
.72:								; if A = $0004 go to .62, A / 2, A / 2, d0 = A, ...
	cmp.w #$0004
	beq .62
	lsr a
	lsr a
	sta.b d0
	lda.w attribute,x
	bit.w #$0800
	beq .73
	lda.b d0
	eor.w #$0001
	sta.b d0
.73:								; if d3 < $0004 go to .74, A xor $FFFF, A + $0008
	lda.b d3
	cmp.w #$0004
	bcc .74
	eor.w #$FFFF
	adc.w #$0008
.74:								; if A >= $0002 go to .70, A = puckz, A - $0008, ...
	cmp.w #$0002
	bcs .70
	lda.w puckz
	sec
	sbc.w #$0008
	bpl .75
	lda.w puckvz
	sec
	sbc.w #$0800
	bpl .75
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0002
	lda.b [a0],y
	cmp.w #$0009
	bcc .75
	lda.w facedir,x
	cmp.w #$0002
	beq .75
	cmp.w #$0006
	beq .75
	lda.w puckc
	bmi .75
	dec.b d0
	dec.b d0
.75:								; d0 * 2, a1 = assgoalie_list, Y = d0, ...
	asl.b d0
	lda.w #assgoalie_list>>16
	sta.b a1+2
	lda.w #assgoalie_list&$FFFF
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	sta.w pfalock,x
	jsl.l SetSPAFromA
	lda.l Crowdlevel
	clc
	adc.w #$0096
	sta.l Crowdlevel
	lda.w #$001E
	sta.b crowdhold
.76:								; d0 = [a0], A = pucky, A - $0102, if the result >= 0 go to .77, ...
	lda.b [a0]
	sta.b d0
	lda.w pucky
	sec
	sbc.w #$0102
	bpl .77
	lda.w pucky
	sec
	sbc.w #$FEFE
	bpl .78
.77:								; d0 = $0018, if puckx >= 0 go to .78, d0 = $FFE8
	lda.w #$0018
	sta.b d0
	lda.w puckx
	bpl .78
	lda.w #$FFE8
	sta.b d0
.78:								; if playerpad,x < 0 go to .79, go to GoalieTargetReturn
	lda.w playerpad,x
	bmi .79
	jmp.w GoalieTargetReturn
.79:								; if puckc < 0 go to .83, if pfteam,x = pfteam,y go to .83, ...
	ldy.w puckc
	bmi .83
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .83
	lda.w SPA,y
	cmp.w #SPAshotf&$FFFF
	bcc .82
	cmp.w #$1EFB
	bcs .82
	lda.w Yvel,y
	bit.w #$8000
	beq .80
	eor.w #$FFFF
	inc a
.80:								; r0 = A, A = Xvel,y, if $8000 bits clear go to .81, A xor $FFFF, ...
	sta.b r0
	lda.w Xvel,y
	bit.w #$8000
	beq .81
	eor.w #$FFFF
	inc a
.81:								; A / 2, if A >= r0 go to .82, if goaliestopped is not 0 go to .83, ...
	lsr a
	cmp.b r0
	bcs .82
	lda.w goaliestopped
	bne .83
	stz.w Xvel,x
	stz.w Yvel,x
	inc.w goaliestopped
	rtl
.82:								; goaliestopped = 0
	stz.w goaliestopped
.83:								; d1 = d2, push A, A = Xvel,x, A and $00FF, ...
	lda.b d2
	sta.b d1
	pha
	pei ($7F)
	lda.w Xvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .84
	ora.w #$FF00
.84:								; A xor $FFFF, A + 1, d0 = A, pull A, ...
	eor.w #$FFFF
	inc a
	sta.b d0
	pla
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Yvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .85
	ora.w #$FF00
.85:								; A xor $FFFF, A + 1, d1 = A, pull A, ...
	eor.w #$FFFF
	inc a
	sta.b d1
	pla
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w #$0005
	sta.b tmp0
	cpx.w puckc
	bne .86
	asl.b tmp0
.86:								; A = d0, if $8000 bits clear go to .87, A xor $FFFF, A + 1
	lda.b d0
	bit.w #$8000
	beq .87
	eor.w #$FFFF
	inc a
.87:								; if A >= tmp0 go to .89, A = d1, if $8000 bits clear go to .88, ...
	cmp.b tmp0
	bcs .89
	lda.b d1
	bit.w #$8000
	beq .88
	eor.w #$FFFF
	inc a
.88:								; if A >= tmp0 go to .89, d0 = 0, d1 = 0
	cmp.b tmp0
	bcs .89
	stz.b d0
	stz.b d1
.89:								; call vtoa, temp2b,x = d0
	jsl.l vtoa
	lda.b d0
	sta.w temp2b,x
.90:								; if playerpad,x >= 0 go to .rtl3, d2 = temp2b,x, A - $0007, ...
	ldy.w playerpad,x
	bpl .rtl3
	lda.w temp2b,x
	sta.b d2
	sec
	sbc.w #$0007
	beq .91
	bmi .91
	jmp.w stopna
.91:								; go to playeracc
	jml.l playeracc
.92:								; go to .78
	jmp.w .78
.rtl3:								; return
	rtl
.93:								; if puckc >= 0 go to .92, A = iflags, if a $0004 bit set go to .92, ...
	lda.w puckc
	bpl .92
	lda.w iflags
	bit.w #$0004
	bne .92
	lda.w puckx
	bit.w #$8000
	beq .94
	eor.w #$FFFF
	inc a
.94:								; if A - $0068 < 0 go to .92, A = puckvy, ...
	cmp.w #$0068
	bmi .92
	lda.w puckvy
	bit.w #$8000
	beq .95
	eor.w #$FFFF
	inc a
.95:								; if A - $3800 < 0 go to .92, if pucky - $00BE >= 0 go to .96, ...
	cmp.w #$3800
	bmi .92
	lda.w pucky
	cmp.w #$00BE
	bpl .96
	lda.w pucky
	cmp.w #$FF42
	bpl .92
.96:								; A = puckvy, if pfgoal,x = 0 go to .97, A xor $FFFF, A + 1
	lda.w puckvy
	ldy.w pfgoal,x
	beq .97
	eor.w #$FFFF
	inc a
.97:								; if A - $FC00 < 0 go to .92, a1 = 0, a2 = $0002, ...
	cmp.w #$FC00
	bmi .92
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq .98
	stz.b a2
	lda.w #$0002
	sta.b a1
.98:								; Y = a1, if tmnear,y < $0064 go to .99, Y = a2, ...
	ldy.b a1
	lda.w tmnear,y
	cmp.w #$0064
	bcc .99
	ldy.b a2
	lda.w tmnear,y
	cmp.w #$0064
	bcc .99
	lda.w #$000F
	sta.b d0
	jmp.w assinsert
.99:								; go to .78
	jmp.w .78
