ReplayMode:							; open instant replay and restore the live frame on exit
	bit.w pausepad
	bpl .1
	stz.w pausepad
.1:									; SavedGameframes = gameframes, ReplayGameframes = 0, ...
	lda.b gameframes
	sta.w SavedGameframes
	stz.w ReplayGameframes
	lda.w #$0000
	sta.l Crowdlevel
	lda.w #$0800
	tsb.w sflags
	jsl.l ClrHor
	jsl.l ClearTextMap
	jsl.l WaitTransfers
	sep #$20
	lda.b #$13
	sta.l TM
	pea.w $7F98
	lda.b #$00
	sta.l CGADD
	pla
	sta.l CGDATA
	pla
	sta.l CGDATA
	rep #$20
	lda.w #$FFFF
	sta.w replaylock
	sta.l $7E24DA
	lda.w #$007E
	sta.b r1+2
	lda.b $08
	sta.b r1
	ldx.w #PadButtonsMap>>16
	lda.w #PadButtonsMap&$FFFF
	jsl.l MapSetToWRAM
	ldx.b $08
	ldy.w #$00DF
	clc
.loop:								; loop: A = $7E0000,x, A + $3E4B, $7E0000,x = A, X + 1, ...
	lda.l $7E0000,x
	adc.w #$3E4B
	sta.l $7E0000,x
	inx
	inx
	dey
	bpl .loop
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $06A0
	pea.w $44B0
	pea.w $007E
	lda.b $08
	clc
	adc.w #$01C0
	pha
	pea.w $01C0
	pea.w $5821
	pea.w $007E
	pei ($08)
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0070
	pea.w $007E
	adc.w #$06A0
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	lda.w recbpr
	pha
	lda.w recbpr+2
	pha
	lda.w #$0020
	trb.w sflags
	lda.b Vpos
	pha
	lda.b Hpos
	pha
	lda.w recbpr
	cmp.w #$0000
	lda.w recbpr+2
	sbc.w #$007F
	bcs .2
.loop2:								; loop: recbpr+2 = $007F, recbpr = 0
	lda.w #$007F
	sta.w recbpr+2
	stz.w recbpr
.2:									; A = $007F, A - recbpr+2, if carry clear go to .loop2, A = recbpr, ...
	lda.w #$8EF8
	cmp.w recbpr
	lda.w #$007F
	sbc.w recbpr+2
	bcc .loop2
	lda.w recbpr
	sec
	sbc.w #$0000
	sta.b r2
	lda.w recbpr+2
	sbc.w #$007F
	sta.b r2+2
	lda.w #$007A
	sta.b r1
	jsl.l Div32U
	lda.b r2+2
	bne .loop2
	lda.w recbpr+2
	sta.b $75
	lda.w recbpr
	sta.b a4
	pea.w $0000
.loop3:								; loop: ReplayGameframes - 1, call suba4, pull A, A + 1, ...
	dec.w ReplayGameframes
	jsl.l suba4
	pla
	inc a
	pha
	lda.b d7
	bne .loop3
	pla
	lsr a
	pha
.loop4:								; loop: if $01,s = 0 go to .3, ReplayGameframes + 1, call adda4, ...
	lda.b $01,s
	beq .3
	inc.w ReplayGameframes
	jsl.l adda4
	pla
	dec a
	pha
	bra .loop4
.3:									; pull A, replayHpos = Hpos, replayVpos = Vpos, fadestep = $000A, ...
	pla
	lda.b Hpos
	sta.w replayHpos
	lda.b Vpos
	sta.w replayVpos
	lda.w #$000A
	sta.w fadestep
	jsl.l ScreenOn
	jsl.l SprSort
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
UpdateReplayCamera:					; track the replay camera, render the frame and continue input
	lda.w replaylock
	bpl .1
	jmp.w .12
.1:									; X = A, Xpos+32 = Xpos,x, if Xpos,x - replayHpos >= 0 go to .3, ...
	tax
	lda.w Xpos,x
	sta.w Xpos+32
	cmp.w replayHpos
	bpl .3
	lda.w replayHpos
	sec
	sbc.w #$0004
	cmp.w Xpos+32
	bpl .2
	lda.w Xpos+32
.2:									; go to .4
	bra .4
.3:									; A = replayHpos, A + $0004, if A - Xpos+32 < 0 go to .4, A = Xpos+32
	lda.w replayHpos
	clc
	adc.w #$0004
	cmp.w Xpos+32
	bmi .4
	lda.w Xpos+32
.4:									; if A - $FFC8 >= 0 go to .5, A = $FFC8
	cmp.w #$FFC8
	bpl .5
	lda.w #$FFC8
.5:									; if A - $0038 < 0 go to .6, A = $0038
	cmp.w #$0038
	bmi .6
	lda.w #$0038
.6:									; Hpos = A, replayHpos = A, Ypos+32 = Ypos,x, ...
	sta.b Hpos
	sta.w replayHpos
	lda.w Ypos,x
	sta.w Ypos+32
	cmp.w replayVpos
	bpl .8
	lda.w replayVpos
	sec
	sbc.w #$0004
	cmp.w Ypos+32
	bpl .7
	lda.w Ypos+32
.7:									; go to .9
	bra .9
.8:									; A = replayVpos, A + $0004, if A - Ypos+32 < 0 go to .9, A = Ypos+32
	lda.w replayVpos
	clc
	adc.w #$0004
	cmp.w Ypos+32
	bmi .9
	lda.w Ypos+32
.9:									; if A - $FF39 >= 0 go to .10, A = $FF39
	cmp.w #$FF39
	bpl .10
	lda.w #$FF39
.10:								; if A - $0100 < 0 go to .11, A = $0100
	cmp.w #$0100
	bmi .11
	lda.w #$0100
.11:								; Vpos = A, replayVpos = A, A = X, A / 2, ...
	sta.b Vpos
	sta.w replayVpos
	txa
	lsr a
	sta.w PadControlObj+12
	jmp.w .24
.12:								; if A = $FFFF go to .23, if Xpos+32 - replayHpos >= 0 go to .14, ...
	cmp.w #$FFFF
	beq .23
	lda.w Xpos+32
	cmp.w replayHpos
	bpl .14
	lda.w replayHpos
	sec
	sbc.w #$0002
	cmp.w Xpos+32
	bpl .13
	lda.w Xpos+32
.13:								; go to .15
	bra .15
.14:								; A = replayHpos, A + $0002, if A - Xpos+32 < 0 go to .15, A = Xpos+32
	lda.w replayHpos
	clc
	adc.w #$0002
	cmp.w Xpos+32
	bmi .15
	lda.w Xpos+32
.15:								; if A - $FFC8 >= 0 go to .16, A = $FFC8
	cmp.w #$FFC8
	bpl .16
	lda.w #$FFC8
.16:								; if A - $0038 < 0 go to .17, A = $0038
	cmp.w #$0038
	bmi .17
	lda.w #$0038
.17:								; Hpos = A, replayHpos = A, if Ypos+32 - replayVpos >= 0 go to .19, ...
	sta.b Hpos
	sta.w replayHpos
	lda.w Ypos+32
	cmp.w replayVpos
	bpl .19
	lda.w replayVpos
	sec
	sbc.w #$0002
	cmp.w Ypos+32
	bpl .18
	lda.w Ypos+32
.18:								; go to .20
	bra .20
.19:								; A = replayVpos, A + $0002, if A - Ypos+32 < 0 go to .20, A = Ypos+32
	lda.w replayVpos
	clc
	adc.w #$0002
	cmp.w Ypos+32
	bmi .20
	lda.w Ypos+32
.20:								; if A - $FF39 >= 0 go to .21, A = $FF39
	cmp.w #$FF39
	bpl .21
	lda.w #$FF39
.21:								; if A - $0100 < 0 go to .22, A = $0100
	cmp.w #$0100
	bmi .22
	lda.w #$0100
.22:								; Vpos = A, replayVpos = A, go to .24
	sta.b Vpos
	sta.w replayVpos
	bra .24
.23:								; replayHpos = Hpos, replayVpos = Vpos
	lda.b Hpos
	sta.w replayHpos
	lda.b Vpos
	sta.w replayVpos
.24:								; timestep = d7, call SprSort, $28 = OAMBuf+$1FF, $2A = OAMHighBytes, ...
	lda.b d7
	sta.w timestep
	jsl.l SprSort
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l RenderReplayFrame
	jsl.l WaitTransfers
	stz.w replaynewframe
ReadReplayCameraInput:				; read replay input and move or lock the camera cursor
	inc.w ReplayGameframes
	ldx.b d7
	bne .1
	inx
.1:									; call ReadPads, call ReadPausePad, d7 = $0001, if minus go to .2, ...
	jsl.l ReadPads
	jsl.l ReadPausePad
	lda.w #$0001
	sta.b d7
	bit.w replaylock
	bmi .2
	lda.b d2
	bit.w #$0F00
	bne .2
	lda.b d0
	and.w #$FFF8
	ora.w #$0008
	sta.b d0
.2:									; A = d0, if $0008 bits clear go to .3, go to ProcessReplayPlayback
	lda.b d0
	bit.w #$0008
	beq .3
	jmp.w ProcessReplayPlayback
.3:									; d5 = A, d4 = $FFFF, d4+2 = A, replaylock = A, ...
	sta.b d5
	lda.w #$FFFF
	sta.b d4
	sta.b d4+2
	sta.w replaylock
	lda.w #$0016
	sta.b a0
.loop:								; loop: Y = a0, if position,y < 0 go to .5, A = Xpos,y, A - Xpos+32, ...
	ldy.b a0
	lda.w position,y
	bmi .5
	lda.w Xpos,y
	sec
	sbc.w Xpos+32
	sta.b d0
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w Ypos+32
	sta.b d1
	sta.b d3
	jsl.l vtoa
	cmp.w #$0008
	beq .5
	sec
	sbc.b d5
	beq .4
	cmp.w #$0001
	beq .4
	cmp.w #$0007
	bne .5
.4:									; A = d2, A / 2, A / 2, A and $01FE, ...
	lda.b d2
	lsr a
	lsr a
	and.w #$01FE
	tax
	lda.l SignedSquareTable,x
	sta.b d0
	lda.b d3
	lsr a
	and.w #$03FC
	lsr a
	tax
	lda.l SignedSquareTable,x
	adc.b d0
	cmp.b d4+2
	bcs .5
	sta.b d4+2
	lda.b a0
	sta.b d4
.5:									; a0 - 1, a0 - 1, if the result >= 0 go to .loop, if d4 < 0 go to .6, ...
	dec.b a0
	dec.b a0
	bpl .loop
	lda.b d4
	bmi .6
	lda.b d4+2
	cmp.w #$0002
	bcs .6
	lda.b d4
	sta.w replaylock
	lda.w #$001E
	sta.b d7
	lda.w #$0020
	trb.w sflags
	jmp.w UpdateReplayCamera
.6:									; call ReadPausePad, replaylock = $FFFE, A = $0020, d0 * 2, ...
	jsl.l ReadPausePad
	lda.w #$FFFE
	sta.w replaylock
	lda.w #$0020
	tsb.w sflags
	asl.b d0
	asl.b d0
	ldx.b d0
	lda.l ReplayCursorSteps,x
	adc.w Xpos+32
	sta.b d2
	ldy.w #$0020
	lda.l ReplayCursorSteps,x
	xba
	and.w #$FF00
	sta.w Xvel,y
	pha
	lda.l ReplayCursorSteps+2,x
	clc
	adc.w Ypos+32
	sta.b d3
	lda.l ReplayCursorSteps+2,x
	xba
	and.w #$FF00
	sta.w Yvel,y
	pha
	phy
	pei ($87)
	pei ($8B)
	sty.b a3
	lda.w #$0000
	sta.w Wallcos,y
	sta.w Wallsin,y
	tyx
	lda.w #$0001
	sta.w wcradiusx
	sta.w wcradiusy
	jsl.l checkwallcoll
	pla
	sta.b d3
	pla
	sta.b d2
	ply
	lda.w Wallsin,y
	ora.w Wallcos,y
	beq .13
	lda.w Xvel,y
	bpl .7
	bit.w #$0080
	beq .8
	sec
	sbc.w #$0100
	bra .8
.7:									; if $0080 bits clear go to .8, A + $0100
	bit.w #$0080
	beq .8
	clc
	adc.w #$0100
.8:									; A and $FF00, A + $03,s, A and $00FF, if $0080 bits clear go to .9, ...
	and.w #$FF00
	clc
	adc.b $03,s
	xba
	and.w #$00FF
	bit.w #$0080
	beq .9
	ora.w #$FF00
.9:									; A + d2, d2 = A, A = Yvel,y, if plus go to .10, ...
	clc
	adc.b d2
	sta.b d2
	lda.w Yvel,y
	bit.w #$0080
	bpl .10
	bit.w #$0080
	beq .11
	sec
	sbc.w #$0100
	bra .11
.10:								; if $0080 bits clear go to .11, A + $0100
	bit.w #$0080
	beq .11
	clc
	adc.w #$0100
.11:								; A and $FF00, A + $01,s, A and $00FF, if $0080 bits clear go to .12, ...
	and.w #$FF00
	clc
	adc.b $01,s
	xba
	and.w #$00FF
	bit.w #$0080
	beq .12
	ora.w #$FF00
.12:								; A + d3, d3 = A
	clc
	adc.b d3
	sta.b d3
.13:								; pull A, pull A, Xpos+32 = d2, Hpos = A, ...
	pla
	pla
	lda.b d2
	sta.w Xpos+32
	sta.b Hpos
	lda.b d3
	sta.w Ypos+32
	sta.b Vpos
	lda.w #$0010
	sta.w PadControlObj+12
	jmp.w UpdateReplayCamera
