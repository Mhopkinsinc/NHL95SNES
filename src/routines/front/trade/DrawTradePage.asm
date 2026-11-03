DrawTradePage:						; draws the Trade Players page and starts the two teams' lists
									; (DrawTradeRow)
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	lda.w #$FFFF
	sta.w BG3VScroll
	jsl.l WaitTransfers
	ldx.b d7
	jsl.l DeleteSprite
	ldx.b d7+2
	jsl.l DeleteSprite
	ldx.b a4
	jsl.l DeleteSprite
	ldx.b $75
	jsl.l DeleteSprite
	ldx.b a0
	lda.w #$0003
	jsl.l SetSpriteAnim
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #TradePlayersPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	ldy.w #$2801
	ldx.w #$5084
	jsl.l MapTileBlock
	ldy.w #$2C01
	ldx.w #$51A4
	jsl.l MapTileBlock
	ldy.w #$0005
	lda.w HomeTeam
	jsr.w PrintTeamNameLeft
	ldy.w #$000E
	lda.w VisTeam
	jsr.w PrintTeamNameLeft
	lda.w #$008C
	sta.b $CF
	lda.w #$00C8
	sta.b $D1
	ldx.w #TxtPosition&$FFFF
	ldy.w #$0006
	jsl.l PrintBoldCentred
	ldx.w #TxtPosition&$FFFF
	ldy.w #$000F
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtRating&$FFFF
	ldy.w #$0006
	jsl.l PrintBoldCentred
	ldx.w #TxtRating&$FFFF
	ldy.w #$000F
	jsl.l PrintBoldCentred
	lda.w OptPlayMode
	pha
	lda.w #$0002
	sta.w OptPlayMode
	jsr.w LoadGameRosters
	pla
	sta.w OptPlayMode
	lda.w HomeRoster+2
	clc
	adc.w HomeRoster+4
	adc.w HomeRoster+6
	sta.b $7B
	lda.w VisRoster+2
	clc
	adc.w VisRoster+4
	adc.w VisRoster+6
	sta.b $7D
	ldx.w #$0000
.loop:								; loop: ScratchBuf,x = 0, X + 1, if X is not $7B go to .loop, X = $0000
	stz.w ScratchBuf,x
	inx
	cpx.b $7B
	bne .loop
	ldx.w #$0000
.loop2:								; loop: ScratchBuf+$64,x = 0, X + 1, if X is not $7D go to .loop2, ...
	stz.w ScratchBuf+$64,x
	inx
	cpx.b $7D
	bne .loop2
	lda.w #$0005
	sta.b a1
	sta.b a1+2
	lda.w #$0008
	sta.b a3
	lda.w #$0011
	sta.b a3+2
	lda.w #HomeRoster
	sta.b a4
	lda.w #VisRoster
	sta.b $75
	lda.w #DrawTradeRow
	jsr.w SetupTradeLists
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.b d1+2
	rts
