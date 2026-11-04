updatereplay:						; called from other segments
	lda.w gmode
	bit.w #$0010
	bne .1
	lda.w replaydelay
	beq .3
	dec a
	bne .2
.1:									; go to .rtl
	jmp.w .rtl
.2:									; replaydelay = A
	sta.w replaydelay
.3:									; A = sflags, if a $0400 bit set go to .5, A = recbpr, A + $007A, ...
	lda.w sflags
	bit.w #$0400
	bne .5
	lda.w recbpr
	clc
	adc.w #$007A
	sta.w recbpr
	bcc .4
	inc.w recbpr+2
.4:									; if A is not $8EF8 go to .5, if recbpr+2 is not $007F go to .5, ...
	cmp.w #$8EF8
	bne .5
	lda.w recbpr+2
	cmp.w #$007F
	bne .5
	lda.w #$0010
	tsb.w sflags
	lda.w #$007F
	sta.w recbpr+2
	stz.w recbpr
.5:									; A = $2100, WMADDL&$FF = recbpr, A 8-bit, WMADDH&$FF = recbpr+2, ...
	phd
	lda.w #$2100
	tcd
	lda.w recbpr
	sta.b WMADDL&$FF
	sep #$20
	lda.w recbpr+2
	sta.b WMADDH&$FF
	lda.b #$0F
	sta.w d2
	ldx.w #$0000
	ldy.w #$0001
.loop:								; loop: WMDATA&$FF = Xpos,x, A = Xpos+1,x, A and $0F, r3 = A, ...
	lda.w Xpos,x
	sta.b WMDATA&$FF
	lda.w Xpos+1,x
	and.b #$0F
	sta.w r3
	lda.w Ypos+1,x
	asl a
	asl a
	asl a
	asl a
	ora.w r3
	sta.b WMDATA&$FF
	lda.w Ypos,x
	sta.b WMDATA&$FF
	lda.w frame,x
	sta.b WMDATA&$FF
	lda.w frame+$1,x
	and.b #$3F
	sta.w r3
	lda.w attribute+1,x
	and.b #$18
	asl a
	asl a
	asl a
	ora.w r3
	sta.b WMDATA&$FF
	inx
	inx
	dec.w d2
	bpl .loop
	lda.b #$05
	sta.w d2
	ldx.w #$0000
.loop2:								; loop: WMDATA&$FF = rostnum,x, WMDATA&$FF = rostnum+2,x, ...
	lda.w rostnum,x
	sta.b WMDATA&$FF
	lda.w rostnum+2,x
	sta.b WMDATA&$FF
	lda.w position,x
	bpl .6
	lda.b #$FF
.6:									; A and $0F, r3 = A, if position+2,x >= 0 go to .7, A = $FF
	and.b #$0F
	sta.w r3
	lda.w position+2,x
	bpl .7
	lda.b #$FF
.7:									; A * 2, A * 2, A * 2, A * 2, ...
	asl a
	asl a
	asl a
	asl a
	ora.w r3
	sta.b WMDATA&$FF
	inx
	inx
	inx
	inx
	dec.w d2
	bpl .loop2
	lda.w puckz
	sta.b WMDATA&$FF
	lda.w shadowz
	sta.b WMDATA&$FF
	lda.w recsfx
	sta.b WMDATA&$FF
	lda.w recsfxpitch
	sta.b WMDATA&$FF
	lda.w recsfxpitch+1
	sta.b WMDATA&$FF
	lda.w recsfxvol+1
	sta.b WMDATA&$FF
	lda.w recsfx2
	sta.b WMDATA&$FF
	lda.w recsfxpitch2
	sta.b WMDATA&$FF
	lda.w recsfxpitch2+1
	sta.b WMDATA&$FF
	lda.w recsfxvol2+1
	sta.b WMDATA&$FF
	lda.w d7
	sta.b WMDATA&$FF
	lda.w PadControlObj+2
	asl a
	asl a
	asl a
	asl a
	ora.w PadControlObj
	sta.b WMDATA&$FF
	lda.w PadControlObj+6
	asl a
	asl a
	asl a
	asl a
	ora.w PadControlObj+4
	sta.b WMDATA&$FF
	lda.w PadControlObj+10
	asl a
	asl a
	asl a
	asl a
	ora.w PadControlObj+8
	sta.b WMDATA&$FF
	lda.l Crowdlevel
	sta.b WMDATA&$FF
	lda.l $7E24CB
	sta.b WMDATA&$FF
	lda.w PBnum
	sta.b WMDATA&$FF
	lda.w Hpos
	sta.b WMDATA&$FF
	lda.w Hpos+1
	sta.b WMDATA&$FF
	lda.w Vpos
	sta.b WMDATA&$FF
	lda.w Vpos+1
	sta.b WMDATA&$FF
	lda.w benchframe
	sta.b WMDATA&$FF
	lda.w benchframe+1
	sta.b WMDATA&$FF
	rep #$20
	lda.w #$FFFF
	sta.w recsfx
	sta.w recsfx2
	pld
.rtl:								; return
	rtl
