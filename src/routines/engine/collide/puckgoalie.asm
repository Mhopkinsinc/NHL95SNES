puckgoalie:							; called from other segments
	lda.w gmode
	bit.w #$0010
	beq .1
	jmp.w .rtl
.1:									; d2 = 0, if puckz - $0008 >= 0 go to .2, d2 + 1, d2 + 1
	stz.b d2
	lda.w puckz
	cmp.w #$0008
	bpl .2
	inc.b d2
	inc.b d2
.2:									; A = $0000, A - d0, d0 = A, A = $0000, ...
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	and.w #$0007
	sta.b d0
	and.w #$0003
	sta.b d1
	bne .3
	lda.w seed
	sta.b d0
.3:									; A = d0, A and $0004, A / 2, A / 2, ...
	lda.b d0
	and.w #$0004
	lsr a
	lsr a
	eor.w #$0001
	clc
	adc.b d2
	asl a
	sta.b d2
	lda.w aggress,y
	sta.b d1
	lda.b d2
	beq .4
	lda.w passacc,y
	sta.b d1
	lda.b d2
	cmp.w #$0002
	beq .4
	lda.w spodds,y
	sta.b d1
	lda.b d2
	cmp.w #$0004
	beq .4
	lda.w endurance,y
	sta.b d1
.4:									; A = d1, A + $000F, d1 = A, A = attribute,y, ...
	lda.b d1
	clc
	adc.w #$000F
	sta.b d1
	lda.w attribute,y
	bit.w #$0800
	beq .5
	lda.b d2
	eor.w #$0002
	sta.b d2
.5:									; A = frame,y, A - SPFgdive, if A >= $0018 go to .6, ...
	lda.w frame,y
	sec
	sbc.w #SPFgdive
	cmp.w #$0018
	bcs .6
	lda.w puckz
	cmp.w #$0005
	bmi .6
	jmp.w .rtl
.6:									; call ChkShotStat, call a2touchpuck, A = puckvy, ...
	jsl.l ChkShotStat
	jsl.l a2touchpuck
	lda.w puckvy
	bit.w #$8000
	beq .7
	eor.w #$FFFF
	inc a
.7:									; A and $7F00, tmp0 = A, A = $0011, call StartSoundVolume, ...
	and.w #$7F00
	sta.b tmp0
	xba
	tsb.b tmp0
	lda.w #$0011
	jsl.l StartSoundVolume
	lda.w puckvy
	cmp.w #$3000
	bpl .8
	cmp.w #$D000
	bpl .11
.8:									; A = CwdExciteLvl, A + $000A, if the result < 0 go to .9, ...
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .9
	sta.w CwdExciteLvl
.9:									; Y = a2, if pfteam,y = 0 go to .10, A = $000A, call StartSound, ...
	ldy.b a2
	lda.w pfteam,y
	beq .10
	lda.w #$000A
	jsl.l StartSound
	bra .11
.10:								; A = Crowdlevel, A + $0258, Crowdlevel = A, crowdhold = $003C
	lda.l Crowdlevel
	clc
	adc.w #$0258
	sta.l Crowdlevel
	lda.w #$003C
	sta.b crowdhold
.11:								; if puckc < 0 go to .12, A / 2
	lda.w puckc
	bmi .12
	lsr a
.12:								; d2 = A, if plus go to .13, go to .21
	sta.b d2
	bpl .13
	jmp.w .21
.13:								; if X is not puckc go to .14, go to .21
	cpx.w puckc
	bne .14
	jmp.w .21
.14:								; A = $FF00, d2 * 2, a0 = d2, Y = A, ...
	lda.w #$FF00
	tsb.w puckc
	asl.b d2
	lda.b d2
	sta.b a0
	tay
	lda.w #$0014
	sta.w nopuck,y
	tya
	lsr a
	sta.w lastplayer
	lda.w #$000C
	trb.w sflags
.15:								; puckvz = 0, Y = a2, nopuck,y = $000A, temp4,y = $0004, ...
	stz.w puckvz
	ldy.b a2
	lda.w #$000A
	sta.w nopuck,y
	lda.w #$0004
	sta.w temp4,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	bne .16
	lda.b a2
	jsl.l GetFrameHot
.16:								; A = d1, A and $00FF, if $0080 bits clear go to .17, A or $FF00
	lda.b d1
	and.w #$00FF
	bit.w #$0080
	beq .17
	ora.w #$FF00
.17:								; d1 = A, if d1 = 0 go to .18, d1 + 1
	sta.b d1
	lda.b d1
	beq .18
	inc.b d1
.18:								; Y = a2, A = Yvel,y, if the result < 0 go to .19, A = $0000, ...
	ldy.b a2
	lda.w Yvel,y
	eor.b d1
	bmi .19
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.19:								; A 8-bit, Xvel+1,x = d0, Yvel+1,x = d1, A 16-bit, ...
	sep #$20
	lda.b d0
	sta.w Xvel+1,x
	lda.b d1
	sta.w Yvel+1,x
	rep #$20
	jmp.w puckflip
.rtl:								; return
	rtl
.20:								; go to .15
	jmp.w .15
.21:								; A = $0002, A + shotspd,y, A and $FF00, A * 2, ...
	lda.w #$0002
	clc
	adc.w shotspd,y
	xba
	and.w #$FF00
	asl a
	jsl.l randomd0A
	adc.w #$2000
	sta.b d0
	cmp.w puckvx
	bmi .20
	lda.b d0
	cmp.w puckvy
	bmi .20
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	cmp.w puckvx
	bpl .20
	lda.b d0
	cmp.w puckvy
	bpl .20
	ldy.b a2
	lda.w pflags,y
	bit.w #$1000
	bne .20
	stz.w puckvz
	jmp.w puckglue
