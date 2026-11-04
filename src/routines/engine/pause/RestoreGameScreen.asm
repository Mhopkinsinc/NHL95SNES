RestoreGameScreen:					; leaves the pause screen: the team songs back when the pause loaded its
									; music, then the game screen rebuilt (refs, frame tiles, digit font, rink
									; tiles, centre ice, meter font, face off map, the period box)
	jsl.l SoundVolumeDown
	jsl.l FadeOutWait
	lda.w PauseMusicOn
	beq .1
	jsl.l LoadTeamSongs
.1:									; DMAEnShadow = 0, call WaitTransfers, r1+2 = $007E, A = $21F0, ...
	stz.w DMAEnShadow
	jsl.l WaitTransfers
	lda.w #$007E
	sta.b r1+2
	lda.w #$21F0
	jsl.l AllocWorkBuf
	pha
	sta.b r1
	lda.w #RefsMap&$FFFF
	ldx.w #RefsMap>>16
	jsl.l MapSetToWRAM
	ply
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $18A0
	pea.w $2200
	pea.w $007E
	tya
	clc
	adc.w #$0930
	pha
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0050
	pea.w $007E
	adc.w #$18A0
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$21F0
	jsl.l FreeWorkBuf
	ldx.w #$20A0
	stx.b tmp2
	ldx.w #$2000
	stx.b tmp1
	lda.w frame+$20
	jsl.l QueueFrameTiles
	ldx.w #$20A8
	stx.b tmp2
	ldx.w #$2004
	stx.b tmp1
	lda.w frame+$22
	jsl.l QueueFrameTiles
	ldx.w #$20C0
	stx.b tmp2
	ldx.w #$2008
	stx.b tmp1
	lda.w frame+$24
	jsl.l QueueFrameTiles
	ldx.w #$20C8
	stx.b tmp2
	ldx.w #$200C
	stx.b tmp1
	lda.w frame+$26
	jsl.l QueueFrameTiles
	ldx.w #$20E0
	stx.b tmp2
	ldx.w #$2010
	stx.b tmp1
	lda.w frame+$28
	jsl.l QueueFrameTiles
	ldx.w #$20E8
	stx.b tmp2
	ldx.w #$2014
	stx.b tmp1
	lda.w frame+$2A
	jsl.l QueueFrameTiles
	ldx.w #$2100
	stx.b tmp2
	ldx.w #$2018
	stx.b tmp1
	lda.w frame+$2C
	jsl.l QueueFrameTiles
	ldx.w #$2108
	stx.b tmp2
	ldx.w #$201C
	stx.b tmp1
	lda.w frame+$2E
	jsl.l QueueFrameTiles
	ldx.w #$2120
	stx.b tmp2
	ldx.w #$2020
	stx.b tmp1
	lda.w frame+$30
	jsl.l QueueFrameTiles
	ldx.w #$2128
	stx.b tmp2
	ldx.w #$2024
	stx.b tmp1
	lda.w frame+$32
	jsl.l QueueFrameTiles
	ldx.w #$2140
	stx.b tmp2
	ldx.w #$2028
	stx.b tmp1
	lda.w frame+$34
	jsl.l QueueFrameTiles
	ldx.w #$2148
	stx.b tmp2
	ldx.w #$202C
	stx.b tmp1
	lda.w frame+$36
	jsl.l QueueFrameTiles
	jsl.l WaitTransfers
	ldx.w #$2180
	stx.b tmp2
	ldx.w #$2034
	stx.b tmp1
	sta.w frame+$3C
	jsl.l QueueFrameTiles
	lda.w #$2030
	sta.b tmp1
	lda.w #$2160
	sta.b tmp2
	lda.w #SPFgoal
	jsl.l QueueFrameTiles
	lda.w #$2168
	sta.b tmp2
	lda.w #SPFgoal+1
	jsl.l QueueFrameTiles
	lda.w #$2588
	sta.b tmp2
	lda.w #SPFpad
	jsl.l QueueFrameTiles
	lda.w #$2035
	sta.b tmp1
	lda.w #SPFpuck
	jsl.l QueueFrameTiles
	lda.w #$2454
	sta.b tmp1
	lda.w #$25E0
	sta.b tmp2
	lda.w #SPFreplay
	jsl.l QueueFrameTiles
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.w #$01E0
	pha
	jsl.l AllocWorkBuf
	pea.w $6360
	ldx.w #$007E
	phx
	stx.b r0+2
	pha
	sta.b r0
	lda.w #DigitFontTiles&$FFFF
	ldx.w #DigitFontTiles>>16
	jsl.l Decompress
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$01E0
	jsl.l FreeWorkBuf
	lda.w #IceRinkMap&$FFFF
	sta.b r1
	lda.w #IceRinkMap>>16
	sta.b r1+2
	lda.b [r1]
	clc
	adc.b r1
	bcc .2
	inc.b r1+2
	clc
.2:									; A + $0002, if carry clear go to .3, r1+2 + 1
	adc.w #$0002
	bcc .3
	inc.b r1+2
	clc
.3:									; r0 = A, r0+2 = r1+2, r1 = A, A + [r1], ...
	sta.b r0
	ldx.b r1+2
	stx.b r0+2
	sta.b r1
	adc.b [r1]
	bcc .4
	inc.b r1+2
	clc
.4:									; A + $0009, r1 = A, if carry clear go to .5, r1+2 + 1
	adc.w #$0009
	sta.b r1
	bcc .5
	inc.b r1+2
.5:									; A = r0, A + $0008, if carry clear go to .6, r0+2 + 1
	lda.b r0
	clc
	adc.w #$0008
	bcc .6
	inc.b r0+2
.6:									; r0 = A, A = $4100, call AllocWorkBuf, RestoreScreenBuf = A, ...
	sta.b r0
	lda.w #$4100
	jsl.l AllocWorkBuf
	sta.w RestoreScreenBuf
	ldx.w #$007E
	jsr.w DecompressLZSS
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $4100
	pea.w $0000
	pea.w $007E
	lda.w RestoreScreenBuf
	pha
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $001E
	pea.w $0001
	pea.w GamePalette0>>16
	pea.w (GamePalette0+2)&$FFFF
	pea.w $0002
	pea.w $0000
	pea.w BackdropColour>>16
	pea.w BackdropColour&$FFFF
	pea.w $0040
	pea.w $0010
	pei ($32)
	pei ($30)
	lda.w HomeTeam
	pea.w $0020
	pea.w $0040
	pea.w $00C0
	xba
	lsr a
	lsr a
	adc.w #$3F22
	pha
	lda.w VisTeam
	pea.w $0020
	pea.w $0030
	pea.w $00C0
	xba
	lsr a
	lsr a
	adc.w #$3F02
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$4100
	jsl.l FreeWorkBuf
	lda.w #$4E00
	jsl.l AllocWorkBuf
	sta.w RestoreScreenBuf
	sta.b r0
	lda.w #$007E
	sta.b r0+2
	ldx.w #CenterIceTiles>>16
	lda.w #CenterIceTiles&$FFFF
	jsl.l Decompress
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0300
	pea.w $2080
	pea.w $007E
	lda.w HomeTeam
	asl a
	adc.w HomeTeam
	xba
	adc.w RestoreScreenBuf
	pha
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0060
	pea.w $00C2
	lda.w HomeTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$ADCA
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$4E00
	jsl.l FreeWorkBuf
	lda.w #$03E7
	sta.w Oldrow
	ldy.w #$4800
	lda.w #MeterFontTiles&$FFFF
	ldx.w #MeterFontTiles>>16
	jsl.l DecompressToVRAM
	lda.w #$13E0
	jsl.l AllocWorkBuf
	sta.w RestoreScreenBuf
	sta.b r1
	lda.w #$007E
	sta.b r1+2
	lda.w #FaceOffMap&$FFFF
	ldx.w #FaceOffMap>>16
	jsl.l MapSetToWRAM
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $09C0
	pea.w $4320
	pea.w $007E
	clc
	lda.w RestoreScreenBuf
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
	jsl.l RestoreWorkBuf
	sep #$20
	lda.b #$13
	sta.l TM
	rep #$20
	jsl.l DrawPeriodBox
	jsl.l WaitTransfers
	jml.l RestoreWorkBuf
