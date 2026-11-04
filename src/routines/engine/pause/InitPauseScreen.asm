InitPauseScreen:					; the pause screen's set-up: pausemenuon / pausetab $FFFF, the game's text
									; map read from VRAM into a buffer, BackupPauseBuffers, PauseScreenMap
									; unpacked to the pause map buffer, then PauseScreenDraw
	jsl.l forceblack
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	lda.w #$FFFF
	sta.w pausemenuon
	sta.w pausetab
	lda.w #$0802
	jsl.l AllocWorkBuf
	sta.l pausesavebuf
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0802
	pea.w $0080
	pea.w $5800
	pea.w $3981
	pea.w $007E
	lda.l pausesavebuf
	pha
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	jsl.l BackupPauseBuffers
	lda.w #$2D60
	jsl.l AllocWorkBuf
	sta.w PauseMapBuf
	sta.b r1
	jsl.l MarkWorkBuf
	lda.w #$007E
	sta.b r1+2
	lda.w #PauseScreenMap&$FFFF
	ldx.w #PauseScreenMap>>16
	jsl.l MapSetToWRAM
	lda.w #$012A
	ldy.w #$0523
	jsr.w FillPauseMapTileRun
	lda.w #$016A
	ldy.w #$052D
	jsr.w FillPauseMapTileRun
	lda.w #$0102
	ldy.w #$0537
	jsr.w FillPauseMapTileRun
	lda.w #$0142
	ldy.w #$0541
	jsr.w FillPauseMapTileRun
	ldy.w #$045F
	ldx.w PauseMapBuf
	clc
.loop:								; loop: A = $7E0000,x, A + $1420, $7E0000,x = A, X + 1, ...
	lda.l $7E0000,x
	adc.w #$1420
	sta.l $7E0000,x
	inx
	inx
	dey
	bpl .loop
PauseScreenDraw:					; draws the pause screen from its map buffer: a sprite (record $1F, placed
									; by gsp), the colours, the map queued, both teams' nickname tiles, the
									; scores and clock, the penalty boxes, the arrow font, screen on
	jsl.l ResetSprites
	lda.w #$0039
	sta.b $1A
	lda.w gsp
	asl a
	tax
	lda.l PauseSpriteX,x
	sta.b $18
	lda.w #$001F
	jsl.l CreateSprite
	stx.w PauseSprite
	lda.w #$0100
	sta.b $22
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	jsl.l WaitTransfers
	sep #$20
	lda.b #$11
	sta.l TM
	lda.b #$00
	sta.l CGADD
	sta.l CGDATA
	sta.l CGDATA
	lda.b #$43
	sta.l CGADD
	pea.w $318C
	pla
	sta.l CGDATA
	pla
	sta.l CGDATA
	lda.b #$47
	sta.l CGADD
	pea.w $000C
	pea.w $253F
	ldx.w #$0003
.loop:								; loop: pull A, CGDATA = A, X - 1, if the result >= 0 go to .loop, ...
	pla
	sta.l CGDATA
	dex
	bpl .loop
	rep #$20
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0700
	pea.w $5800
	pea.w $007E
	lda.w PauseMapBuf
	pha
	pea.w $2200
	pea.w $2200
	pea.w $007E
	clc
	adc.w #$08C0
	pha
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0040
	pea.w $0050
	pea.w $007E
	adc.w #$2200
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	lda.w #$4100
	jsl.l AllocWorkBuf
	sta.b r0
	pha
	lda.w #$007E
	sta.b r0+2
	ldx.w #TeamNicknameTiles>>16
	lda.w #TeamNicknameTiles&$FFFF
	jsl.l Decompress
	pla
	sta.b r0
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0280
	pea.w $3430
	pea.w $007E
	lda.w HomeTeam
	asl a
	sta.b r0+2
	asl a
	asl a
	adc.b r0+2
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b r0
	pha
	pea.w $0280
	pea.w $3570
	pea.w $007E
	lda.w VisTeam
	asl a
	sta.b r0+2
	asl a
	asl a
	adc.b r0+2
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b r0
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	jsr.w PauseScoresClock
	jsr.w ShowPenaltyBoxes
	jsl.l WaitTransfers
	lda.w #$4100
	jsl.l FreeWorkBuf
	ldy.w #$4A00
	lda.w #ArrowFontTiles&$FFFF
	ldx.w #ArrowFontTiles>>16
	jsl.l DecompressToVRAM
	jsl.l WaitTransfers
	jsl.l FadeIn
	rts
