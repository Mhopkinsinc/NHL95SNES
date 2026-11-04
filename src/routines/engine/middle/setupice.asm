setupice:							; sets up the rink screen: the rink map set (IceRinkMap), the tiles and
									; the scoreboard
	jsl.l forceblack
	sep #$20
	lda.b #$13
	sta.l TM
	rep #$20
	lda.w #IceRinkMap&$FFFF
	ldx.w #IceRinkMap>>16
	jsl.l MapSetToUnpackbuf
	ldx.w #$2A7E
	clc
.loop:								; loop: rinkmapbuf,x = unpackbuf&$FFFF,x, X - 1, X - 1, ...
	lda.w unpackbuf&$FFFF,x
	sta.l rinkmapbuf,x
	dex
	dex
	bpl .loop
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $4100
	pea.w $0000
	pea.w $007E
	pea.w $7B5C
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
	pea.w $007E
	pea.w $BC5C
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
	lda.w #CenterIceTiles&$FFFF
	ldx.w #CenterIceTiles>>16
	jsl.l DecompressUnpackbuf
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
	adc.w #unpackbuf&$FFFF
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
	lda.w #RefsMap&$FFFF
	ldx.w #RefsMap>>16
	jsl.l MapSetToUnpackbuf
	ldx.w #$092E
	clc
.loop2:								; loop: A = unpackbuf&$FFFF,x, A + $3420, RefsMapBuf,x = A, X - 1, ...
	lda.w unpackbuf&$FFFF,x
	adc.w #$3420
	sta.l RefsMapBuf,x
	dex
	dex
	bpl .loop2
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $18A0
	pea.w $2200
	pea.w $007E
	pea.w $5A0C
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0050
	pea.w $007E
	pea.w $72AC
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	stz.w vramrow
	stz.w Oldrow
	lda.w #$FE90
	sta.w Vscroll
	ldy.w #$4800
	lda.w #MeterFontTiles&$FFFF
	ldx.w #MeterFontTiles>>16
	jsl.l DecompressToVRAM
	jsl.l ClearTextMap
	jsl.l WaitTransfers
	lda.w #$FFFF
	sta.w PadArrowTileMode
	sta.w PadArrowTileMode+2
	sta.w PadArrowTileMode+4
	sta.w PadArrowTileMode+6
	sta.w PadArrowTileMode+8
	lda.w #$D02A
	sta.b r0
	lda.w #$007F
	sta.b r0+2
	lda.w #LinePieceTiles&$FFFF
	ldx.w #LinePieceTiles>>16
	jsl.l Decompress
	jsl.l DrawScoreBox
	jmp.w DrawPeriodBox
