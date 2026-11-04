puckfaceoff2:						; assignment: the face off and the setup for play; on a new assignment the
									; crowd, the music, the puck and the scroll are reset (ClrHor)
	lda.w pflags,x
	bit.w #$0002
	bne .1
	jmp.w TickFaceoffCountdown
.1:									; A and $FFFD, pflags,x = A
	and.w #$FFFD
	sta.w pflags,x
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($8F)
	pei ($91)
	pei ($93)
	pei ($95)
	pei ($97)
	pei ($99)
	pei ($9B)
	pei ($9D)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($73)
	pei ($75)
	pei ($77)
	pei ($79)
	pei ($7B)
	pei ($7D)
	lda.w #$0006
	jsl.l StartSound
	jsl.l StartCrowdSound
	lda.w #$FFFF
	sta.w recsfx
	sta.w recsfx2
	stz.w hattrick
	lda.l Crowdlevel
	cmp.w #$0258
	bcc .2
	lda.w #$0258
	sta.l Crowdlevel
.2:									; call FadeOutWait, fadein = $001E, call WaitTransfers, ...
	jsl.l FadeOutWait
	lda.w #$001E
	sta.w fadein
	jsl.l WaitTransfers
	jsl.l DrawScoreBox
	lda.w PBnum
	beq .4
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b r3
	lda.w PBnum
	and.w #$000F
	cmp.b r3
	beq .4
	bcs .3
	lda.w #$0004
	jsl.l PlayTeamSong
	bra .7
.3:									; A = $0001, call PlayTeamSong, go to .7
	lda.w #$0001
	jsl.l PlayTeamSong
	bra .7
.4:									; if percue is not 0 go to .5, if OptPlayMode = $0004 go to .7, ...
	ldy.w percue
	bne .5
	lda.w OptPlayMode
	cmp.w #$0004
	beq .7
	jsl.l RandomWord
	and.w #$0003
	bne .7
.5:									; A = $0000, if percue is not 0 go to .6, A = $0002
	lda.w #$0000
	ldy.w percue
	bne .6
	lda.w #$0002
.6:									; call PlayTeamSong, percue = 0
	jsl.l PlayTeamSong
	stz.w percue
.7:									; A = $000D, A = $0001, iflags = 0, replaydelay = 0, ...
	lda.w #$000D
	trb.w sflags
	lda.w #$0001
	trb.w sflags3
	stz.w iflags
	stz.w replaydelay
	lda.w #$FFFF
	sta.w RefCnt
	sta.w puckcross+2
	sta.w puckcross+6
	sta.w puckz
	sta.w passReceiverPlayerNum
	asl a
	sta.w puckc
	lda.w #$8200
	trb.w sflags
	stz.w refwindow
	stz.w penmsgbox
	lda.w #$0500
	tsb.w sflags
	jsl.l ClrHor
	lda.w #$0008
	tsb.w tmflags
	tsb.w tmflags+2
	jsl.l CloseLCBoxes
	lda.w #$0008
	trb.w tmflags
	trb.w tmflags+2
	stz.b Vpos
	stz.b Hpos
	lda.w fox
	sta.w puckx
	lda.w foy
	sta.w pucky
	stz.w puckvx
	stz.w puckvy
	stz.w puckvz
	stz.w Xvel+24
	stz.w Yvel+24
	stz.w Xpos+24
	lda.w #$0117
	sta.w Ypos+24
	stz.w Xvel+26
	stz.w Yvel+26
	stz.w Xpos+26
	lda.w #$FEE8
	sta.w Ypos+26
	lda.w #SPFpuck
	sta.w frame+$1E
	stz.w SPA+$1E
	stz.w attribute+$1E
	stz.w attribute+28
	lda.w #$0040
	trb.w sflags
	lda.w #$0064
	sta.b d4
.loop:								; loop: call checkwindow, d4 - 1, if the result >= 0 go to .loop, ...
	jsl.l checkwindow
	dec.b d4
	bpl .loop
	lda.w #$003C
	sta.w yleader
	lda.w OptPlayMode
	cmp.w #$0001
	bne .8
	lda.w homepracplayers
	inc a
	sta.w tmap
	lda.w awaypracplayers
	inc a
	sta.w tmap+2
.8:									; call ResetBench, a2 = 0, call setpersonel, call forcepldata, ...
	jsl.l ResetBench
	stz.b a2
	jsl.l setpersonel
	jsl.l forcepldata
	inc.b a2
	inc.b a2
	jsl.l setpersonel
	jsl.l forcepldata
	jsl.l resetplstuff
	lda.w #$FFFF
	sta.w tmtouch2
	sta.w tmtouch3
	sta.w tmtouch2+2
	sta.w tmtouch3+2
	pei ($71)
	pei ($6F)
	stz.b a3
	lda.w #$000B
	sta.b d2
	pha
.9:									; if a3 >= $0018 go to .10, A = pfteam,x, A / 2, A xor gmode, ...
	ldx.b a3
	cpx.w #$0018
	bcs .10
	lda.w pfteam,x
	lsr a
	eor.w gmode
	and.w #$0002
	lsr a
	eor.w #$0001
	sta.w pfgoal,x
.10:								; A = pnum,x, A * 2, if X < $000C go to .11, A + $0034
	lda.w pnum,x
	asl a
	cpx.w #$000C
	bcc .11
	clc
	adc.w #$0034
.11:								; X = A, if tmpdst,x < 0 go to .12, if a $1000 bit set go to .12, ...
	tax
	lda.w tmpdst,x
	bmi .12
	bit.w #$1000
	bne .12
	jmp.w .30
.12:								; X = a3, Xpos,x = $FF10, Ypos,x = 0, frame,x = $0001, ...
	ldx.b a3
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w frame,x
	lda.w position,x
	sta.b d1
	bpl .13
	jmp.w .30
.13:								; if zero go to .18, if penshot = 0 go to .15, push X, X = $0008, ...
	beq .18
	lda.w penshot
	beq .15
	phx
	ldx.w #$0008
	lda.w BA_Team
	beq .14
	ldx.w #$0014
.14:								; pnum,x = BA_Skater_Offset, d3 = A, pull X
	lda.w BA_Skater_Offset
	sta.w pnum,x
	sta.b d3
	plx
.15:								; d0 = $0016, if d1 is not $0004 go to .17, a2 = 0, ...
	lda.w #$0016
	sta.b d0
	lda.b d1
	cmp.w #$0004
	bne .17
	stz.b a2
	lda.w pfteam,x
	beq .16
	inc.b a2
	inc.b a2
.16:								; Y = a2, A = pnum,x, A and $00FF, tmtouch1,y = A, ...
	ldy.b a2
	lda.w pnum,x
	and.w #$00FF
	sta.w tmtouch1,y
	lda.w #$0004
	sta.w tmflags,y
	lda.w #$0017
	sta.b d0
.17:								; call assinsert
	jsl.l assinsert
.18:								; d4 = tmap, X = a3, if pfteam,x = 0 go to .19, d4 = tmap+2
	lda.w tmap
	sta.b d4
	ldx.b a3
	lda.w pfteam,x
	beq .19
	lda.w tmap+2
	sta.b d4
.19:								; A = d4, A xor $FFFF, A + 1, A + $0006, ...
	lda.b d4
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0006
	asl a
	asl a
	asl a
	sta.b d4
	lda.w OptPlayMode
	cmp.w #$0001
	bne .20
	stz.b d4
.20:								; a1 = FaceoffFormations + d4, PenShotFormation in a penalty shot
	lda.w #FaceoffFormations>>16
	sta.b a1+2
	lda.w #FaceoffFormations&$FFFF
	clc
	adc.b d4
	sta.b a1
	lda.w penshot
	beq .21
	lda.w #PenShotFormation>>16
	sta.b a1+2
	lda.w #PenShotFormation&$FFFF
	sta.b a1
.21:								; Y = d1, A = [a1],y, A and $00FF, A * 2, ...
	ldy.b d1
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	sta.b d4
	lda.w #FaceoffSpots>>16
	sta.b a1+2
	lda.w #FaceoffSpots&$FFFF
	sta.b a1
	ldy.b d4
	lda.b [a1],y
	sta.b d0
	iny
	iny
	lda.b [a1],y
	sta.b d1
	lda.w pfgoal,x
	bne .22
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.22:								; if position,x = 0 go to .27, if d4 - $0009 >= 0 go to .26, A = fox, ...
	lda.w position,x
	beq .27
	lda.b d4
	cmp.w #$0009
	bpl .26
	lda.w fox
	eor.b d0
	bpl .24
	lda.w foy
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .23
	ora.w #$E000
.23:								; A xor $FFFF, A + 1, A + d1, d1 = A
	eor.w #$FFFF
	inc a
	clc
	adc.b d1
	sta.b d1
.24:								; A = fox, A / 2, A / 2, if $2000 bits clear go to .25, ...
	lda.w fox
	lsr a
	lsr a
	bit.w #$2000
	beq .25
	ora.w #$C000
.25:								; d3 = A, A = d0, A - d3, d0 = A
	sta.b d3
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
.26:								; A = d0, A + fox, d0 = A, A = d1, ...
	lda.b d0
	clc
	adc.w fox
	sta.b d0
	lda.b d1
	clc
	adc.w foy
	sta.b d1
.27:								; Xpos,x = d0, A - puckx, A xor $FFFF, A + 1, ...
	lda.b d0
	sta.w Xpos,x
	sec
	sbc.w puckx
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	sta.w Ypos,x
	sec
	sbc.w pucky
	eor.w #$FFFF
	inc a
	sta.b d1
	stz.w Xvel,x
	stz.w Yvel,x
	jsl.l vtoa
	lda.b d0
	sta.w facedir,x
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w pfalock,x
	stz.w SPA,x
	lda.w position,x
	bne .28
	lda.w #SPAgready&$FFFF
	bra .29
.28:								; A = SPAglide&$FFFF
	lda.w #SPAglide&$FFFF
.29:								; call SetSPAFromA, call updateanim
	jsl.l SetSPAFromA
	jsl.l updateanim
.30:								; a3 + 1, a3 + 1, pull A, A - 1, ...
	inc.b a3
	inc.b a3
	pla
	dec a
	sta.b d2
	bmi .31
	pha
	jmp.w .9
.31:								; call SprSort, pull A, a3 = A, pull A, ...
	jsl.l SprSort
	pla
	sta.b a3
	pla
	sta.b a3+2
	lda.w penshot
	beq .35
	ldx.w #$0008
.loop2:								; loop: if padside,x is not BA_Team go to .32, if X = pspad go to .32, ...
	lda.w padside,x
	cmp.w BA_Team
	bne .32
	cpx.w pspad
	beq .32
	ora.w #$8000
	sta.w padside,x
	stz.w cont1team,x
.32:								; X - 1, X - 1, if the result >= 0 go to .loop2, A = BA_Team, ...
	dex
	dex
	bpl .loop2
	lda.w BA_Team
	eor.w #$0002
	sta.b d0
	tax
	lda.w teampads,x
	beq .35
	ldy.w puckpadnext,x
.loop3:								; loop: Y + 1, Y + 1, if Y is not $000A go to .33, Y = $0000
	iny
	iny
	cpy.w #$000A
	bne .33
	ldy.w #$0000
.33:								; if padside,y is not d0 go to .loop3, d1 = Y, A = Y, ...
	lda.w padside,y
	cmp.b d0
	bne .loop3
	sty.b d1
	tya
	sta.w puckpadnext,x
	ldx.w #$0008
.loop4:								; loop: if padside,x is not d0 go to .34, if X = d1 go to .34, ...
	lda.w padside,x
	cmp.b d0
	bne .34
	cpx.b d1
	beq .34
	ora.w #$8000
	sta.w padside,x
	stz.w cont1team,x
.34:								; X - 1, X - 1, if the result >= 0 go to .loop4
	dex
	dex
	bpl .loop4
.35:								; X = a3, call FaceoffPads, push X, push Y, ...
	ldx.b a3
	jsl.l FaceoffPads
	phx
	phy
	jsl.l ClearTextMapTop
	inc.w TransfersReady
	ldy.w #$0036
	lda.w fox
	bpl .36
	ldy.w #$00BE
.36:								; d0 = Y, A = Y, fodropx = A, A - $002E, ...
	sty.b d0
	tya
	sta.w fodropx
	sec
	sbc.w #$002E
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$5860
	sta.w FaceoffBoxVRAM
	lda.w #$005C
	sta.w fodropy
	jsl.l SeatPenaltyBox
	lda.w penshot
	beq .37
	jmp.w DrawPenaltyShotMatchup
.37:								; if OptPlayMode is not $0001 go to .38, go to PracticeFaceoffSetup
	lda.w OptPlayMode
	cmp.w #$0001
	bne .38
	jmp.w PracticeFaceoffSetup
.38:								; fobox = $0001, call WaitTransfers, call RestoreWorkBuf, A = $0A00, ...
	lda.w #$0001
	sta.w fobox
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	lda.w #$0A00
	jsl.l AllocWorkBuf
	sta.w FaceoffBoxBuf
	sta.b r1
	jsl.l MarkWorkBuf
	lda.w #$007E
	sta.b r1+2
	lda.w #FaceOffMap&$FFFF
	ldx.w #FaceOffMap>>16
	jsl.l MapSetToWRAM
	lda.w FaceoffBoxBuf
	tax
	ldy.w #$04FF
	clc
.loop5:								; loop: A = $7E0000,x, A + $3E32, $7E0000,x = A, X + 1, ...
	lda.l $7E0000,x
	adc.w #$3E32
	sta.l $7E0000,x
	inx
	inx
	dey
	bpl .loop5
	lda.w #$0000
	sta.w FaceoffBoxTimer
	jsl.l QueueFaceoffBox
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $09C0
	pea.w $4320
	pea.w $007E
	clc
	lda.w FaceoffBoxBuf
	adc.w #$0A00
	pha
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0070
	pea.w $007E
	adc.w #$09C0
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w fodropy
	clc
	adc.w #$0005
	sta.b $1A
	lda.w fodropx
	sec
	sbc.w #$002B
	sta.b $18
	lda.w #$001E
	jsl.l CreateSpriteSharePal
	stx.w FaceoffSpriteLeft
	clc
	lda.b $18
	adc.w #$0059
	sta.b $18
	lda.w gsp
	lsr a
	lda.w HomeSpritePal
	bcc .39
	lda.w VisSpritePal
.39:								; call UseSpritePalette, A = $001E, call CreateSpriteSharePal, ...
	jsl.l UseSpritePalette
	lda.w #$001E
	jsl.l CreateSpriteSharePal
	stx.w FaceoffSpriteRight
	lda.b $36,x
	eor.w #$4000
	sta.b $36,x
	inc.b $38,x
	lda.w #$0001
	jsl.l SetSpriteAnim
	lda.w gsp
	lsr a
	lda.w VisSpritePal
	bcc .40
	lda.w HomeSpritePal
.40:								; call UseSpritePalette, call DrawPeriodBox
	jsl.l UseSpritePalette
	jsl.l DrawPeriodBox
FinishFaceoffSetup:					; end of the face off set-up: the line box (line changes on, no penalty
									; shot), the drop time in temp1, the centres' and the ref's frames
									; (fofdata2, fofdata), fodir1 / fodir2 cleared, the registers restored
	ply
	plx
	ldx.b a3
	lda.w OptLine
	beq .1
	lda.w penshot
	ora.w penshotlive
	beq .2
.1:									; go to .5
	jmp.w .5
.2:									; A = $59A1, if fox >= 0 go to .3, A = $59B2
	lda.w #$59A1
	ldx.w fox
	bpl .3
	lda.w #$59B2
.3:									; push A, X = $000C, Y = $0002, call Framer, ...
	pha
	ldx.w #$000C
	ldy.w #$0002
	jsl.l Framer
	ldx.w tmline
	ldy.w tmline+2
	lda.w gmode
	bit.w #$0002
	beq .4
	txy
	ldx.w tmline+2
.4:									; d0 = X, d1 = Y, A = $000B, call AllocWorkBuf, ...
	stx.b d0
	sty.b d1
	lda.w #$000B
	jsl.l AllocWorkBuf
	tay
	jsl.l MarkWorkBuf
	lda.w #$000A
	sta.w $0000,y
	lda.b d0
	asl a
	adc.b d0
	tax
	lda.l linelist,x
	sta.w $0001,y
	lda.l linelist+1,x
	sta.w $0002,y
	lda.w #$A0A0
	sta.w $0004,y
	lda.w #$A0A0
	sta.w $0006,y
	lda.b d1
	asl a
	adc.b d1
	tax
	lda.l linelist,x
	sta.w $0008,y
	lda.l linelist+1,x
	sta.w $0009,y
	pla
	clc
	adc.w #$0021
	tax
	tya
	txy
	ldx.w #$007E
	jsl.l QueueVRAMDMALen
.5:									; call RandomWord, A and $007F, A + $00B4, d0 = A, ...
	jsl.l RandomWord
	and.w #$007F
	adc.w #$00B4
	sta.b d0
	ldx.b a3
	sta.w temp1,x
	lda.w OptPlayMode
	cmp.w #$0001
	bne .6
	lda.w #$003C
	sta.w temp1,x
.6:									; if penshot = 0 go to .7, temp1,x = $00B4
	lda.w penshot
	beq .7
	lda.w #$00B4
	sta.w temp1,x
.7:									; fofdata2 = $0001, fofdata2+2 = $8000, fofdata+2 = A, ...
	lda.w #$0001
	sta.w fofdata2
	lda.w #$8000
	sta.w fofdata2+2
	sta.w fofdata+2
	lda.w #$0004
	sta.w fofdata2+4
	lda.w #$A800
	sta.w fofdata2+6
	lda.w #$0007
	sta.w fofdata
	lda.w gmode
	bit.w #$0002
	bne .8
	lda.w #$8800
	sta.w fofdata2+2
	lda.w #$A000
	sta.w fofdata2+6
.8:									; fodir1 = $FFFF, fodir2 = A, pull A, $7D = A, ...
	lda.w #$FFFF
	sta.w fodir1
	sta.w fodir2
	pla
	sta.b $7D
	pla
	sta.b $7B
	pla
	sta.b $79
	pla
	sta.b $77
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
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d7+2
	pla
	sta.b d7
	pla
	sta.b d6+2
	pla
	sta.b d6
	pla
	sta.b d5+2
	pla
	sta.b d5
	pla
	sta.b d4+2
	pla
	sta.b d4
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
	rtl
