adda4:								; from ReplayMode, ProcessReplayPlayback, ProcessReplayPlayback, ...
	stz.b d7
	lda.w sflags
	bit.w #$0400
	beq .1
	pei ($75)
	pei ($73)
	jsl.l adda43
	lda.b $75
	sta.b tmp1
	lda.b a4
	sta.b tmp0
	pla
	sta.b a4
	pla
	sta.b $75
	lda.b tmp0
	cmp.w recbpr
	bne .1
	lda.b tmp1
	cmp.w recbpr+2
	bne .1
	rtl
.1:									; if a4 is not recbpr go to .2, if $75 is not recbpr+2 go to .2, return
	lda.b a4
	cmp.w recbpr
	bne .2
	lda.b $75
	cmp.w recbpr+2
	bne .2
	rtl
.2:									; call RestoreReplayFrame
	jsl.l RestoreReplayFrame
adda43:								; from adda4 and other segments
	lda.b a4
	clc
	adc.w #$007A
	sta.b a4
	bcc .1
	inc.b $75
.1:									; if A is not $8EF8 go to .rtl, if $75 is not $007F go to .rtl, ...
	cmp.w #$8EF8
	bne .rtl
	lda.b $75
	cmp.w #$007F
	bne .rtl
	lda.w #$007F
	sta.b $75
	stz.b a4
.rtl:								; return
	rtl
.loop:								; loop: Xpos,x = $80, r3 = $80, A and $000F, ...
	lda.b $80
	sta.w Xpos,x
	lda.b $80
	sta.w r3
	and.w #$000F
	bit.w #$0008
	beq .2
	ora.w #$00F0
.2:									; Xpos+1,x = A, Ypos,x = $80, A = r3, A / 2, ...
	sta.w Xpos+1,x
	lda.b $80
	sta.w Ypos,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0008
	beq .3
	ora.w #$00F0
.3:									; Ypos+1,x = A, frame,x = $80, r3 = $80, A and $003F, ...
	sta.w Ypos+1,x
	lda.b $80
	sta.w frame,x
	lda.b $80
	sta.w r3
	and.w #$003F
	sta.w frame+$1,x
	lda.w attribute+1,x
	and.w #$00E7
	sta.w attribute+1,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	and.w #$0018
	ora.w attribute+1,x
	sta.w attribute+1,x
	inx
	inx
	dey
	bpl .loop
	lda.b $80
	sta.w Xpos+4,x
	lda.b $80
	sta.w r3
	and.w #$000F
	bit.w #$0008
	beq .4
	ora.w #$00F0
.4:									; Xpos+5,x = A, Ypos+4,x = $80, A = r3, A / 2, ...
	sta.w Xpos+5,x
	lda.b $80
	sta.w Ypos+4,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0008
	beq .5
	ora.w #$00F0
.5:									; Ypos+5,x = A, frame+$4,x = $80, r3 = $80, A and $003F, ...
	sta.w Ypos+5,x
	lda.b $80
	sta.w frame+$4,x
	lda.b $80
	sta.w r3
	and.w #$003F
	sta.w frame+$5,x
	lda.w attribute+5,x
	and.w #$00E7
	sta.w attribute+5,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	and.w #$0018
	ora.w attribute+5,x
	sta.w attribute+5,x
	ldx.w #$0000
.loop2:								; loop: Xpos+24,x = $80, r3 = $80, A and $000F, ...
	lda.b $80
	sta.w Xpos+24,x
	lda.b $80
	sta.w r3
	and.w #$000F
	bit.w #$0008
	beq .6
	ora.w #$00F0
.6:									; Xpos+25,x = A, Ypos+24,x = $80, A = r3, A / 2, ...
	sta.w Xpos+25,x
	lda.b $80
	sta.w Ypos+24,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0008
	beq .7
	ora.w #$00F0
.7:									; Ypos+25,x = A, frame+$18,x = $80, r3 = $80, A and $003F, ...
	sta.w Ypos+25,x
	lda.b $80
	sta.w frame+$18,x
	lda.b $80
	sta.w r3
	and.w #$003F
	sta.w frame+$19,x
	lda.w attribute+25,x
	and.w #$00E7
	sta.w attribute+25,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	and.w #$0018
	ora.w attribute+25,x
	sta.w attribute+25,x
	inx
	inx
	cpx.w #$0004
	bcc .loop2
	ldx.w tmp0
	ldy.w #$0002
.loop3:								; loop: rostnum,x = $80, rostnum+2,x = $80, position+1,x = 0, ...
	lda.b $80
	sta.w rostnum,x
	lda.b $80
	sta.w rostnum+2,x
	stz.w position+1,x
	lda.b $80
	sta.w r3
	and.w #$000F
	cmp.w #$000F
	bne .8
	lda.w #$FFFF
	sta.w position+1,x
.8:									; position,x = A, position+3,x = 0, A = r3, A / 2, ...
	sta.w position,x
	stz.w position+3,x
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	cmp.w #$000F
	bne .9
	lda.w #$FFFF
	sta.w position+3,x
.9:									; position+2,x = A, X + 1, X + 1, X + 1, ...
	sta.w position+2,x
	inx
	inx
	inx
	inx
	dey
	bpl .loop3
	lda.b $80
	sta.w puckz
	bpl .10
	lda.w #$FFFF
	bra .11
.10:								; A = $0000
	lda.w #$0000
.11:								; puckz+1 = A, shadowz = $80, if $80 >= 0 go to .12, A = $FFFF, ...
	sta.w puckz+1
	lda.b $80
	sta.w shadowz
	bpl .12
	lda.w #$FFFF
	bra .13
.12:								; A = $0000
	lda.w #$0000
.13:								; shadowz+1 = A, recsfx = $80, recsfxpitch = $80, recsfxpitch+1 = $80, ...
	sta.w shadowz+1
	lda.b $80
	sta.w recsfx
	lda.b $80
	sta.w recsfxpitch
	lda.b $80
	sta.w recsfxpitch+1
	lda.b $80
	sta.w recsfxvol+1
	lda.b $80
	sta.w recsfx2
	lda.b $80
	sta.w recsfxpitch2
	lda.b $80
	sta.w recsfxpitch2+1
	lda.b $80
	sta.w recsfxvol2+1
	lda.b $80
	sta.w d7
	lda.b $80
	sta.w r3
	and.w #$000F
	sta.w PadControlObj
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+2
	lda.b $80
	sta.w r3
	and.w #$000F
	sta.w PadControlObj+4
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+6
	lda.b $80
	sta.w r3
	and.w #$000F
	sta.w PadControlObj+8
	lda.w r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+10
	lda.b $80
	sta.l Crowdlevel
	lda.b $80
	sta.l $7E24CB
	lda.b $80
	sta.w PBnum
	bpl .14
	lda.w #$FFFF
	bra .15
.14:								; A = $0000
	lda.w #$0000
.15:								; PBnum+1 = A, A = sflags, if a $0020 bit set go to .16, Hpos = $80, ...
	sta.w PBnum+1
	lda.w sflags
	bit.w #$0020
	bne .16
	lda.b $80
	sta.b Hpos
	lda.b $80
	sta.b $CC
	lda.b $80
	sta.b Vpos
	lda.b $80
	sta.b $CE
	lda.b $80
	sta.w benchframe
	lda.b $80
	sta.w benchframe+1
	bra RestoreReplayFrame
.16:								; A = $80, A = $80, A = $80, A = $80, ...
	lda.b $80
	lda.b $80
	lda.b $80
	lda.b $80
	lda.b $80
	sta.w benchframe
	lda.b $80
	sta.w benchframe+1
RestoreReplayFrame:					; from suba4, adda4, ...
	pei ($83)
	inc.w replaynewframe
	lda.b a4
	sta.l WMADDL
	sep #$20
	lda.b $75
	sta.l WMADDH
	lda.b #$0F
	sta.b d1
	ldx.w #$0000
.loop:								; loop: Xpos,x = WMDATA, r3 = WMDATA, A and $0F, ...
	lda.l WMDATA
	sta.w Xpos,x
	lda.l WMDATA
	sta.b r3
	and.b #$0F
	bit.b #$08
	beq .1
	ora.b #$F0
.1:									; Xpos+1,x = A, Ypos,x = WMDATA, A = r3, A / 2, ...
	sta.w Xpos+1,x
	lda.l WMDATA
	sta.w Ypos,x
	lda.b r3
	lsr a
	lsr a
	lsr a
	lsr a
	bit.b #$08
	beq .2
	ora.b #$F0
.2:									; Ypos+1,x = A, frame,x = WMDATA, r3 = WMDATA, A and $3F, ...
	sta.w Ypos+1,x
	lda.l WMDATA
	sta.w frame,x
	lda.l WMDATA
	sta.b r3
	and.b #$3F
	sta.w frame+$1,x
	lda.w attribute+1,x
	and.b #$E7
	sta.w attribute+1,x
	lda.b r3
	lsr a
	lsr a
	lsr a
	and.b #$18
	ora.w attribute+1,x
	sta.w attribute+1,x
	inx
	inx
	dec.b d1
	bpl .loop
	lda.b #$05
	sta.b d1
	ldx.w #$0000
.loop2:								; loop: rostnum,x = WMDATA, rostnum+2,x = WMDATA, position+1,x = 0, ...
	lda.l WMDATA
	sta.w rostnum,x
	lda.l WMDATA
	sta.w rostnum+2,x
	stz.w position+1,x
	lda.l WMDATA
	sta.b r3
	and.b #$0F
	cmp.b #$0F
	bne .3
	lda.b #$FF
	sta.w position+1,x
.3:									; position,x = A, position+3,x = 0, A = r3, A / 2, ...
	sta.w position,x
	stz.w position+3,x
	lda.b r3
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	cmp.b #$0F
	bne .4
	lda.b #$FF
	sta.w position+3,x
.4:									; position+2,x = A, X + 1, X + 1, X + 1, ...
	sta.w position+2,x
	inx
	inx
	inx
	inx
	dec.b d1
	bpl .loop2
	lda.l WMDATA
	sta.w puckz
	bpl .5
	lda.b #$FF
	bra .6
.5:									; A = $00
	lda.b #$00
.6:									; puckz+1 = A, shadowz = WMDATA, if WMDATA >= 0 go to .7, A = $FF, ...
	sta.w puckz+1
	lda.l WMDATA
	sta.w shadowz
	bpl .7
	lda.b #$FF
	bra .8
.7:									; A = $00
	lda.b #$00
.8:									; shadowz+1 = A, recsfx = WMDATA, recsfxpitch = WMDATA, ...
	sta.w shadowz+1
	lda.l WMDATA
	sta.w recsfx
	lda.l WMDATA
	sta.w recsfxpitch
	lda.l WMDATA
	sta.w recsfxpitch+1
	lda.l WMDATA
	sta.w recsfxvol+1
	lda.l WMDATA
	sta.w recsfx2
	lda.l WMDATA
	sta.w recsfxpitch2
	lda.l WMDATA
	sta.w recsfxpitch2+1
	lda.l WMDATA
	sta.w recsfxvol2+1
	lda.l WMDATA
	sta.b d7
	lda.l WMDATA
	sta.b r3
	and.b #$0F
	sta.w PadControlObj
	lda.b r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+2
	lda.l WMDATA
	sta.b r3
	and.b #$0F
	sta.w PadControlObj+4
	lda.b r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+6
	lda.l WMDATA
	sta.b r3
	and.b #$0F
	sta.w PadControlObj+8
	lda.b r3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w PadControlObj+10
	lda.l WMDATA
	sta.l Crowdlevel
	lda.l WMDATA
	sta.l $7E24CB
	lda.l WMDATA
	sta.w PBnum
	bpl .9
	lda.b #$FF
	bra .10
.9:									; A = $00
	lda.b #$00
.10:								; PBnum+1 = A, A = sflags, if a $20 bit set go to .11, Hpos = WMDATA, ...
	sta.w PBnum+1
	lda.w sflags
	bit.b #$20
	bne .11
	lda.l WMDATA
	sta.b Hpos
	lda.l WMDATA
	sta.b $CC
	lda.l WMDATA
	sta.b Vpos
	lda.l WMDATA
	sta.b $CE
	lda.l WMDATA
	sta.w benchframe
	lda.l WMDATA
	sta.w benchframe+1
	bra .12
.11:								; A = WMDATA, A = WMDATA, A = WMDATA, A = WMDATA, ...
	lda.l WMDATA
	lda.l WMDATA
	lda.l WMDATA
	lda.l WMDATA
	lda.l WMDATA
	sta.w benchframe
	lda.l WMDATA
	sta.w benchframe+1
.12:								; A 16-bit, A = recsfx, A and $00FF, if A < $0080 go to .13, ...
	rep #$20
	lda.w recsfx
	and.w #$00FF
	cmp.w #$0080
	bcc .13
	ora.w #$FF00
.13:								; recsfx = A, A = recsfx2, A and $00FF, if A < $0080 go to .14, ...
	sta.w recsfx
	lda.w recsfx2
	and.w #$00FF
	cmp.w #$0080
	bcc .14
	ora.w #$FF00
.14:								; recsfx2 = A, pull A, d1 = A, return
	sta.w recsfx2
	pla
	sta.b d1
	rtl
