SetupFreeAgentsScreen:				; SignFreeAgents' screen: VRAM cleared, the BG3 scroll reset, then
									; DrawFreeAgentsPage
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l ClearVRAM
	lda.w #$FFFF
	sta.w BG3VScroll
	jsl.l WaitTransfers
DrawFreeAgentsPage:					; draws the Hire Free Agents page and starts its scrolling list
									; (DrawFreeAgentRow); No Free Agents when there are none
	ldy.w #$2C01
	ldx.w #$5115
	jsl.l MapTileBlock
	ldx.b d7
	jsl.l DeleteSprite
	stz.b d7
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
	lda.w #FreeAgentsPage&$FFFF
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
	stz.b a1
	stz.b a1+2
	ldx.w #$0000
	txy
.loop:								; loop: A = SRPlayerTeams,x, A and $001F, ...
	lda.l SRPlayerTeams,x
	and.w #$001F
	cmp.w #$001A
	bne .1
	inc.b a1
.1:									; Y + 1, if Y >= $027E go to .3, A = SRPlayerTeams+1,x, A / 2, ...
	iny
	cpy.w #$027E
	bcs .3
	lda.l SRPlayerTeams+1,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	cmp.w #$001A
	bne .2
	inc.b a1
.2:									; X + 1, X + 1, X + 1, Y + 1, ...
	inx
	inx
	inx
	iny
	cpy.w #$027E
	bcc .loop
.3:									; if a1 is not 0 go to .loop2, $D5 = $2400, $CF = $0010, $D1 = $00F0, ...
	ldx.b a1
	bne .loop2
	lda.w #$2400
	sta.b $D5
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtNoFreeAgents&$FFFF
	ldy.w #$000E
	jsl.l PrintBoldCentred
	ldx.b a0
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	bra .4
.loop2:								; loop: X - 1, ScratchBuf,x = 0, if not zero go to .loop2, ...
	dex
	stz.w ScratchBuf,x
	bne .loop2
	jsr.w MarkFreeAgentLimits
	lda.w #DrawFreeAgentRow
	ldx.w #$0008
	ldy.w #$000E
	jsr.w StartScrollList
	stz.b d1+2
.4:									; call PrintPositionCounts, call SendTextMap, return
	jsr.w PrintPositionCounts
	jsl.l SendTextMap
	rts
