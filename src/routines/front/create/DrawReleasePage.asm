DrawReleasePage:					; draws the Release Players page and starts its scrolling list of the
									; team's players (DrawReleaseRow)
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l ClearVRAM
	lda.w #$FFFF
	sta.w BG3VScroll
	jsl.l WaitTransfers
	ldy.w #$2C01
	ldx.w #$5115
	jsl.l MapTileBlock
	ldx.b d7
	jsl.l DeleteSprite
	ldx.b a4
	jsl.l DeleteSprite
	ldx.b $75
	jsl.l DeleteSprite
	ldx.b d7+2
	lda.w #$00D0
	sta.b $05,x
	lda.w #$0028
	sta.b $08,x
	ldx.b a0
	lda.w #$0003
	jsl.l SetSpriteAnim
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #ReleasePlayersPage&$FFFF
	jsl.l PrintTextPage
	lda.w #$0010
	sta.b $CF
	lda.w #$008C
	sta.b $D1
	ldy.w #$000C
	ldx.w #TxtPlayer&$FFFF
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00C8
	sta.b $D1
	ldy.w #$000C
	ldx.w #TxtPosition&$FFFF
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldy.w #$000C
	ldx.w #TxtRating&$FFFF
	jsl.l PrintBoldCentred
	lda.w #$00A8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w VisTeam
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$0009
	jsl.l PrintThinCentred
	lda.w OptPlayMode
	pha
	lda.w #$0002
	sta.w OptPlayMode
	jsr.w LoadGameRosters
	pla
	sta.w OptPlayMode
	ldx.w #VisRoster
	lda.w $0002,x
	sta.b d0
	lda.w $0006,x
	sta.b d1
	lda.w $0004,x
	sta.b d0+2
	clc
	adc.b d1
	adc.b d0
	sta.b a1
	stz.b a1+2
	stz.b d1+2
	ldx.w #$0000
.loop:								; loop: ScratchBuf,x = 0, X + 1, if X is not a1 go to .loop, ...
	stz.w ScratchBuf,x
	inx
	cpx.b a1
	bne .loop
	lda.w #DrawReleaseRow
	ldx.w #$0008
	ldy.w #$000E
	jsr.w StartScrollList
	jsr.w PrintPositionCounts
	jsl.l SendTextMap
	rts
