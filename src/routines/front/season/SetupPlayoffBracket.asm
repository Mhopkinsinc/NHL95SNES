SetupPlayoffBracket:				; sets up the playoff bracket screen: the bracket and the team name bar
									; map sets, the titles and the teams' bars, the bracket drawn
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	lda.w #DarkBlueColoursHook&$FFFF
	ldx.w #DarkBlueColoursHook>>16
	jsl.l SetNMIHook
	wai
	ldx.w #$0070
	jsl.l SetupHDMA
	db $03,$21						; inline parameters: DMAP and BBAD
	dl BracketGradientHDMA			; the HDMA table
	db $00							; the indirect bank
	ldx.w #$0060
	jsl.l SetupHDMA
	db $44,$26						; inline parameters: DMAP and BBAD
	dl BracketWindowHDMA1			; the HDMA table
	db $7E							; the indirect bank
	ldx.w #$0050
	jsl.l SetupHDMA
	db $44,$26						; inline parameters: DMAP and BBAD
	dl BracketWindowHDMA2			; the HDMA table
	db $7E							; the indirect bank
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	ldx.b a0
	jsl.l DeleteSprite
	stz.b a0
	jsl.l RefreshSpritesLong
	jsl.l ResetWorkBuf
	lda.w #PlayoffBracketMap&$FFFF
	ldx.w #PlayoffBracketMap>>16
	jsl.l MapSetToUnpackbuf
	ldx.w #$15DE
	clc
.loop:								; loop: A = unpackbuf&$FFFF,x, A + $2A30, rinkmapbuf,x = A, X - 1, ...
	lda.w unpackbuf&$FFFF,x
	adc.w #$2A30
	sta.l rinkmapbuf,x
	dex
	dex
	bpl .loop
	stz.w BG2HScroll
	stz.b a0+2
	stz.b a1
	stz.b a1+2
	lda.w #$FFFF
	sta.w BG2VScroll
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0D40
	pea.w $2300
	pea.w $007E
	pea.w $66BC
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0020
	pea.w $007E
	pea.w $73FC
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #TeamNameBarsMap&$FFFF
	ldx.w #TeamNameBarsMap>>16
	jsl.l MapSetToUnpackbuf
	lda.w #$04E0
	jsl.l AllocWorkBuf
	jsl.l MarkWorkBuf
	ldx.w #$04DE
.loop2:								; loop: A = unpackbuf&$FFFF,x, A or $3400, unpackbuf&$FFFF,x = A, ...
	lda.w unpackbuf&$FFFF,x
	ora.w #$3400
	sta.w unpackbuf&$FFFF,x
	dex
	dex
	bpl .loop2
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $3980
	pea.w $0000
	pea.w $007E
	pea.w (unpackbuf+$4E0)&$FFFF	; the tiles, after the map
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0040
	pea.w $0040
	pea.w $007E
	pea.w (unpackbuf+$3E60)&$FFFF	; the colours, after the tiles
	ldx.w #$001E
.loop3:								; loop: the second 16 colours = the first 16 halved (darker)
	lda.w (unpackbuf+$3E60)&$FFFF,x
	lsr a
	and.w #$BDEF
	sta.w (unpackbuf+$3E80)&$FFFF,x
	dex
	dex
	bpl .loop3
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsr.w RebuildBracketTeams
	stz.b a0
	phd
	lda.w #$2100
	tcd
	stz.b W12SEL&$FF
	lda.w #$00A0
	sta.b WOBJSEL&$FF
	stz.b WBGLOG&$FF
	lda.w #$1717
	sta.b TMW&$FF
	lda.w #$0310
	sta.b CGWSEL&$FF
	sep #$20
	lda.b #$E8
	sta.b COLDATA&$FF
	rep #$20
	pld
	jsl.l InitTextMap
	ldx.w #TxtSeasonPlayoffs&$FFFF
	ldy.w #$0001
	stz.b $CF
	lda.w #$0100
	sta.b $D1
	jsl.l PrintBoldCentred
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.l SRBestOfSeven
	and.w #$00FF
	beq .2
	lda.w #$001A
	sta.b tmp0
.loop4:								; loop: A = tmp0, A * 2, X = A, A = $C30000,x, ...
	lda.b tmp0
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	ldx.b $16
	lda.b $0A
	beq .1
	inx
.1:									; call UnpackText, Y = tmp0, call PrintBoldLeftStr, tmp0 - 1, ...
	jsl.l UnpackText
	ldy.b tmp0
	jsl.l PrintBoldLeftStr
	dec.b tmp0
	bpl .loop4
	lda.w #$0080
	sta.b $CF
	lda.w #$000A
	sta.b tmp0
	lda.w #$0000
.loop5:								; loop: tmp1 = A, call BCDTextLong, Y = tmp0, X = mesarea, ...
	sta.b tmp1
	jsl.l BCDTextLong
	ldy.b tmp0
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	inc.b tmp0
	lda.b tmp1
	inc a
	cmp.w #$0005
	bcc .loop5
	ldy.b tmp0
	ldx.w #TxtNotAvail&$FFFF
	jsl.l PrintBoldLeft
.2:									; X = $001C
	ldx.w #$001C
.loop6:								; loop: if BracketSeriesMarks&$FFFF,x >= 0 go to .3, ...
	lda.w BracketSeriesMarks&$FFFF,x
	bpl .3
	ldy.w BracketTeamBarCells,x
	phx
	jsr.w ToggleTeamBarHighlight
	plx
	ldy.w BracketTeamBarCells+$1E,x
	phx
	jsr.w ToggleTeamBarHighlight
	plx
.3:									; X - 1, X - 1, if the result >= 0 go to .loop6, ...
	dex
	dex
	bpl .loop6
	wai
	jsr.w RefreshBracketColumns
	stz.w fadestep
	jmp.w DrawBracketSeriesSummary
