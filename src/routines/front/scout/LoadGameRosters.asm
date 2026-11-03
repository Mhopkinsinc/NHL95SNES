LoadGameRosters:					; LoadTeamRoster for both teams of the game: HomeTeam into HomeRoster,
									; VisTeam into VisRoster
	lda.w HomeTeam
	ldy.w #HomeRoster
	jsr.w LoadTeamRoster
	lda.w VisTeam
	ldy.w #VisRoster
LoadTeamRoster:						; builds team A's roster table at Y from its team data (from the season
									; data in play modes 2 and 3 or with OptRosters set): the player and
									; goalie counts, the player ids, then the line data at +$6C
	sta.b tmp0
	sty.b tmp1
	ldx.w WorkBufMark
	phx
	tax
	jsl.l MarkWorkBuf
	txa
	ldx.w OptPlayMode
	cpx.w #$0003
	beq .1
	cpx.w #$0002
	bne .2
.1:									; call LoadSeasonRoster, go to .3
	jsr.w LoadSeasonRoster
	bra .3
.2:									; if OptRosters is not 0 go to .1, A * 2, X = A, A = $C30000,x, ...
	ldx.w OptRosters
	bne .1
	asl a
	tax
	lda.l $C30000,x
	tax
	phx
	adc.l $C30006,x
	tax
	lda.l $C30003,x
	pha
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0004,y
	pla
	and.w #$000F
	sta.w $0006,y
	jsr.w UnpackTeamBonuses
	plx
	lda.l $C30000,x
	sta.b $0E
	and.w #$F800
	xba
	lsr a
	lsr a
	lsr a
	sta.b $10
	sta.w $0000,y
	txa
	clc
	adc.l $C30008,x
	tax
	lda.l $C30000,x
	xba
	ldx.w #$0000
.loop:								; loop: X + 1, A * 2, A * 2, A * 2, ...
	inx
	asl a
	asl a
	asl a
	asl a
	bne .loop
	txa
	sta.w $0002,y
	lda.b $0E
	and.w #$07FF
	tax
.loop2:								; loop: A = $C30000,x, A and $3FFF, $0008,y = A, A = X, ...
	lda.l $C30000,x
	and.w #$3FFF
	sta.w $0008,y
	sec
	txa
	sbc.w #$0038
	lsr a
	sta.w $003A,y
	inx
	inx
	iny
	iny
	dec.b $10
	bne .loop2
.3:									; Y = tmp1, A = tmp0, A * 2, X = A, ...
	ldy.b tmp1
	lda.b tmp0
	asl a
	tax
	lda.l $C30000,x
	tax
	phx
	clc
	adc.l $C3000A,x
	tax
	sep #$20
	stz.b tmp2
.loop3:								; loop: $006C,y = $C30000,x, X + 1, Y + 1, A = tmp2, ...
	lda.l $C30000,x
	sta.w $006C,y
	inx
	iny
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.b #$08
	bne .loop3
	rep #$20
	plx
	txa
	clc
	adc.l $C30004,x
	tax
	sep #$20
.loop4:								; loop: $006C,y = $C30000,x, X + 1, Y + 1, A = tmp2, ...
	lda.l $C30000,x
	sta.w $006C,y
	inx
	iny
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.b #$40
	bne .loop4
	rep #$20
	ldy.b tmp1
	lda.w $0000,y
	inc a
	sta.b tmp3
	lda.w $0002,y
	inc a
	sta.b $0A
	clc
	adc.w $0004,y
	sta.b $0C
	stz.b tmp2
.loop5:								; loop: A 8-bit, A = $006D,y, call FixLineDefence, $006D,y = A, ...
	sep #$20
	lda.w $006D,y
	jsr.w FixLineDefence
	sta.w $006D,y
	lda.w $006E,y
	jsr.w FixLineDefence
	sta.w $006E,y
	lda.w $006F,y
	jsr.w FixLineForward
	sta.w $006F,y
	lda.w $0070,y
	jsr.w FixLineForward
	sta.w $0070,y
	lda.w $0071,y
	jsr.w FixLineForward
	sta.w $0071,y
	rep #$20
	tya
	clc
	adc.w #$0008
	tay
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.w #$0007
	bne .loop5
	lda.b (tmp1)
	sta.b tmp2
	ldy.b tmp1
.4:									; if $003A,y < $026A go to .5, go to .10
	lda.w $003A,y
	cmp.w #$026A
	bcc .5
	pea.w $0000
	jmp.w .10
.5:									; X = $0038
	ldx.w #$0038
.6:									; push X, A = $C2FFFE,x, push A, call TeamGoalieRange, ...
	phx
	lda.l $C2FFFE,x
	pha
	jsr.w TeamGoalieRange
	lda.b $01,s
	tax
	clc
	adc.l $C30006,x
	tax
	lda.l $C30003,x
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.b $0A
	sta.b $0A
	lda.l $C30003,x
	and.w #$000F
	adc.b $0A
	sta.b $0A
	lda.w $003A,y
	cmp.b tmp3
	bcs .7
	jmp.w .13
.7:									; if A < $0A go to .8, go to .13
	cmp.b $0A
	bcc .8
	jmp.w .13
.8:									; A = $01,s, X = A, A = $C30000,x, A and $07FF, ...
	lda.b $01,s
	tax
	lda.l $C30000,x
	and.w #$07FF
	tax
	lda.l $C30000,x
	and.w #$3FFF
	cmp.w $0008,y
	bne .9
	pla
	lda.w #$0500
	bra .12
.9:									; A = $003A,y, A - tmp3, A + 1, tmp3 = A, ...
	lda.w $003A,y
	sec
	sbc.b tmp3
	inc a
	sta.b tmp3
	pla
	tax
	sec
	adc.l $C3000A,x
	tax
	sta.b $0A
	lda.l $C30000,x
	and.w #$00FF
	cmp.b tmp3
	beq .11
	inx
	lda.l $C30000,x
	and.w #$00FF
	cmp.b tmp3
	beq .11
	inx
	lda.l $C30000,x
	and.w #$00FF
	cmp.b tmp3
	beq .11
	inx
	lda.l $C30000,x
	and.w #$00FF
	cmp.b tmp3
	beq .11
	inx
	lda.l $C30000,x
	and.w #$00FF
	cmp.b tmp3
	beq .11
.10:								; $00AC,y = $FFFF, $00DE,y = A, go to .14
	lda.w #$FFFF
	sta.w $00AC,y
	sta.w $00DE,y
	bra .14
.11:								; A = X, A - $0A
	txa
	sbc.b $0A
	xba
.12:								; $00DE,y = A, A = $01,s, A * 2, X = A, ...
	sta.w $00DE,y
	lda.b $01,s
	asl a
	tax
	lda.l PhotoPaletteTable-4,x
	sta.w $00AC,y
	lda.l PhotoPaletteTable-2,x
	ora.w $00DE,y
	sta.w $00DE,y
	bra .14
.13:								; pull A, pull X, X - 1, X - 1, ...
	pla
	plx
	dex
	dex
	beq .14
	jmp.w .6
.14:								; pull X, Y + 1, Y + 1, tmp2 - 1, ...
	plx
	iny
	iny
	dec.b tmp2
	beq .15
	jmp.w .4
.15:								; tmp2 = 0, A = tmp2
	stz.b tmp2
	lda.b tmp2
.16:								; A * 2, A + tmp1, Y = A, if OptPlayMode >= $0002 go to .17, ...
	asl a
	adc.b tmp1
	tay
	lda.w OptPlayMode
	cmp.w #$0002
	bcs .17
	lda.w OptRosters
	bne .17
	jmp.w .29
.17:								; if $003A,y >= $026A go to .18, go to .29
	lda.w $003A,y
	cmp.w #$026A
	bcs .18
	jmp.w .29
.18:								; push Y, A = tmp2, A * 2, A * 2, ...
	phy
	lda.b tmp2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b tmp1
	sta.b tmp3
	pha
	lda.b $03,s
	tay
	lda.w $003A,y
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	stz.b $0C
	pei ($A5)
.19:								; call NextSaveBits5, X = tmp3, if A = $0000 go to .22, ...
	jsr.w NextSaveBits5
	ldx.b tmp3
	cmp.w #$0000
	beq .22
	cmp.w #$001D
	bne .20
	lda.w #$003D
	bra .21
.20:								; A + $0040, A + $0C
	clc
	adc.w #$0040
	adc.b $0C
.21:								; $0118,x = A, $0C = $0020, X + 1, tmp3 = X, ...
	sta.w $0118,x
	lda.w #$0020
	sta.b $0C
	inx
	stx.b tmp3
	txa
	sec
	sbc.b $01,s
	cmp.w #$0008
	bcc .19
	bra .24
.22:								; push X
	phx
.loop6:								; loop: A = X, A - $03,s, if A = $0007 go to .23, push X, ...
	txa
	sec
	sbc.b $03,s
	cmp.w #$0007
	beq .23
	phx
	jsr.w NextSaveBits5
	plx
	inx
	bra .loop6
.23:								; pull X
	plx
.24:								; pull A, $0118,x = $0020, $0C = 0, X + 1, ...
	pla
	lda.w #$0020
	sta.w $0118,x
	stz.b $0C
	inx
	stx.b tmp3
	phx
.25:								; call NextSaveBits5, X = tmp3, if A = $0000 go to .loop7, ...
	jsr.w NextSaveBits5
	ldx.b tmp3
	cmp.w #$0000
	beq .loop7
	cmp.w #$001D
	bne .26
	lda.w #$003D
	bra .27
.26:								; A + $0040, A + $0C
	clc
	adc.w #$0040
	adc.b $0C
.27:								; $0118,x = A, $0C = $0020, X + 1, tmp3 = X, ...
	sta.w $0118,x
	lda.w #$0020
	sta.b $0C
	inx
	stx.b tmp3
	txa
	sec
	sbc.b $01,s
	cmp.w #$000A
	bcc .25
	bra .28
.loop7:								; loop: A = X, A - $01,s, if A = $0009 go to .28, call NextSaveBits5, ...
	txa
	sec
	sbc.b $01,s
	cmp.w #$0009
	beq .28
	jsr.w NextSaveBits5
	ldx.b tmp3
	inx
	stx.b tmp3
	bra .loop7
.28:								; pull X, pull A, tmp3 = A, call NextSaveBits7, ...
	plx
	pla
	sta.b tmp3
	jsr.w NextSaveBits7
	ldx.b tmp3
	sta.w $0110,x
	lda.w #$0006
	sta.b $0A
.loop8:								; loop: call NextSaveBits8, A 8-bit, X = tmp3, X + 1, ...
	jsr.w NextSaveBits8
	sep #$20
	ldx.b tmp3
	inx
	stx.b tmp3
	sta.w $0110,x
	rep #$20
	dec.b $0A
	bpl .loop8
	ply
	bra .31
.29:								; X = $0008,y, A = tmp2, A * 2, A * 2, ...
	ldx.w $0008,y
	lda.b tmp2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b tmp1
	tay
	lda.l $C30000,x					; the record's number and 7 rating bytes; its packed name follows
	sta.w $0110,y
	lda.l $C30002,x
	sta.w $0112,y
	lda.l $C30004,x
	sta.w $0114,y
	lda.l $C30006,x
	sta.w $0116,y
	txa
	clc
	adc.w #$0008
	tax
	jsl.l UnpackText
	sep #$20
.loop9:								; loop: $0118,y = $0000,x, if $0000,x = 0 go to .30, X + 1, Y + 1, ...
	lda.w $0000,x
	sta.w $0118,y
	beq .30
	inx
	iny
	bra .loop9
.30:								; A 16-bit
	rep #$20
.31:								; A = tmp2, A + 1, tmp2 = A, if A = (tmp1) go to .32, ...
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.b (tmp1)
	beq .32
	jmp.w .16
.32:								; if OptRosters is not 0 go to .33, if OptPlayMode is not $0002 go to .34
	lda.w OptRosters
	bne .33
	lda.w OptPlayMode
	cmp.w #$0002
	bne .34
.33:								; A = $0000
	lda.w #$0000
.loop10:							; loop: tmp2 = A, A * 2, A + tmp1, Y = A, ...
	sta.b tmp2
	asl a
	adc.b tmp1
	tay
	lda.w $003A,y
	jsr.w PlayerNumberBCD
	lda.b tmp0
	tax
	lda.b tmp2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b tmp1
	tay
	txa
	sep #$20
	sta.w $0110,y
	rep #$20
	lda.b tmp2
	inc a
	cmp.b (tmp1)
	bcc .loop10
.34:								; call RestoreWorkBuf, pull A, WorkBufMark = A, return
	jsl.l RestoreWorkBuf
	pla
	sta.w WorkBufMark
	rts
