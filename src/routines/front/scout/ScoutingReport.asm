ScoutingReport:						; the pregame scouting report: both teams' names and logos, the matchups
									; (ShowMatchups; the next every 300 frames, A next, Y previous) and the
									; commentary (BuildScoutingText) scrolling, X restarts it; start leaves
	jsl.l ResetWorkBuf
	jsl.l ResetSprites
	lda.w OptPlayMode
	cmp.w #$0001
	bne .1
	jsr.w RebuildChangedLines
	rtl
.1:									; BG2VScroll = $0002, Y = $5C00, call QueueClearVRAM, ...
	lda.w #$0002
	sta.w BG2VScroll
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	jsl.l InitTextMap
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldy.w #$0001
	ldx.w #TxtScoutingReport&$FFFF
	jsl.l PrintTitle
	lda.w #(SongLists+$5)&$FFFF
	ldx.w #(SongLists+$5)>>16
	jsl.l LoadSounds
	lda.w #$00A6
	jsl.l StartSound
	jsl.l SoundVolumeUp
	lda.w HomeTeam
	cmp.w #$001A
	bcc .2
	ldy.w #HomeRoster
	jsr.w SetAllStarPhotoPointers
.2:									; if VisTeam < $001A go to .3, Y = VisRoster, call SetAllStarPhotoPointers
	lda.w VisTeam
	cmp.w #$001A
	bcc .3
	ldy.w #VisRoster
	jsr.w SetAllStarPhotoPointers
.3:									; call RebuildChangedLines, $CF = $0018, $D1 = $0060, A = VisTeam, ...
	jsr.w RebuildChangedLines
	lda.w #$0018
	sta.b $CF
	lda.w #$0060
	sta.b $D1
	lda.w VisTeam
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$000E
	jsl.l PrintThinCentred
	lda.w #$00A0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	lda.w HomeTeam
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$000E
	jsl.l PrintThinCentred
	jsl.l SendTextMap
	stz.b $22
	stz.b $24
	ldx.w #$0070
	jsl.l SetupHDMA
	db $03,$21						; inline parameters: DMAP and BBAD
	dl MenuGradientHDMA				; the HDMA table
	db $00							; the indirect bank
	lda.w #$0400
	sta.b tmp1
	lda.w #$5800
	sta.b tmp0
	lda.w #MenuBackMap&$FFFF
	ldx.w #MenuBackMap>>16
	ldy.w #$2000
	jsl.l MapSetToVRAM
	ldy.w #$5000
	jsl.l ClearVRAM
	lda.w #BlueColoursHook
	ldx.w #BlueColoursHook>>16
	jsl.l SetNMIHook
	ldx.w #$50B6
	ldy.w #$3013
	jsr.w MapPhotoTiles
	ldx.w #$50A4
	ldy.w #$3437
	jsr.w MapPhotoTiles
	lda.w #$003D
	sta.b $1A
	lda.w #$0038
	sta.b $18
	lda.w VisTeam
	jsl.l CreateSprite
	stx.b d7
	inc.b $38,x
	lda.w #$0025
	sta.b $1A
	lda.w #$0020
	sta.b $18
	lda.w #$0026
	jsl.l CreateSprite
	stx.b d6
	lda.w #$2000
	sta.b $36,x
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	lda.w #$003D
	sta.b $1A
	lda.w #$00C8
	sta.b $18
	lda.w HomeTeam
	jsl.l CreateSprite
	stx.b d7+2
	inc.b $38,x
	lda.w #$0025
	sta.b $1A
	lda.w #$00B0
	sta.b $18
	lda.w #$0026
	jsl.l CreateSprite
	stx.b d6+2
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	lda.w #$2000
	sta.b $36,x
	ldy.w #$2801
	ldx.w #$51D4
	jsl.l MapTileBlock
	ldy.w #$2C01
	ldx.w #$51C3
	jsl.l MapTileBlock
	jsl.l QueueHomePaletteLong
	jsl.l QueueVisPaletteLong
	jsl.l WaitTransfers
	lda.w #$0006
	sta.w curmatchup
	jsr.w ShowMatchups
	jsr.w RankScoutingHotColdTeams
	jsr.w BuildScoutingText
	lda.w #$8000
	sta.w DMAEnShadow
	lda.w #$03E8
	sta.b a1
	lda.w #$0017
	sta.l TM
	stz.w fadestep
	lda.w #$012C
	sta.w matchuptimer
	lda.w #$0019
	sta.w ScoutingReportTimer
	jsr.w InitScoutDisplay
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
	jsl.l ReadMenuPads
	inc.b $26
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w matchuptimer
	bmi .6
	dec a
	bne .6
	jsr.w NextMatchup
	lda.w ScoutingReportTimer
	sec
	sbc.w #$0005
	bmi .4
	bne .5
.4:									; A = $0001
	lda.w #$0001
.5:									; ScoutingReportTimer = A, A = $012C
	sta.w ScoutingReportTimer
	lda.w #$012C
.6:									; matchuptimer = A, A = ScoutingReportTimer, A - 1, ...
	sta.w matchuptimer
	lda.w ScoutingReportTimer
	dec a
	bne .7
	jsr.w PrintNextScoutWord
	lda.w #$0019
.7:									; ScoutingReportTimer = A, if repeatdelayframes is not 0 go to .loop, ...
	sta.w ScoutingReportTimer
	lda.w repeatdelayframes
	bne .loop
	lda.w padchangeany
	bit.w #$1000
	bne ExitScoutingReport
	bit.w #$0400
	beq .8
	lda.w #$0001
	sta.w ScoutingReportTimer
	lda.w #$0400
	trb.w padlast1
.8:									; if $0800 bits clear go to .9, ScoutingReportTimer + 1, A = $0800
	bit.w #$0800
	beq .9
	inc.w ScoutingReportTimer
	lda.w #$0800
	trb.w padlast1
.9:									; if $0080 bits clear go to .10, A = $8000, call NextMatchup, go to .loop
	bit.w #$0080
	beq .10
	lda.w #$8000
	tsb.w matchuptimer
	jsr.w NextMatchup
	jmp.w .loop
.10:								; if $4000 bits clear go to .11, A = $8000, call PrevMatchup, go to .loop
	bit.w #$4000
	beq .11
	lda.w #$8000
	tsb.w matchuptimer
	jsr.w PrevMatchup
	jmp.w .loop
.11:								; if $0040 bits clear go to .12, call RestartScoutingText
	bit.w #$0040
	beq .12
	jsr.w RestartScoutingText
.12:								; go to .loop
	jmp.w .loop
