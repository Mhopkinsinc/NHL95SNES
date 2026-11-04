TitleScreen:						; the title screen: TitleLogoMap, TitleGoalieMap, TitlePlayersMap, run by
									; tasks
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	jsl.l ResetTransferQueues
	jsl.l ResetSprites
	lda.w #$FFFF
	sta.w BG1VScroll
	sta.w BG2VScroll
	ldy.w #$3800
	jsl.l QueueClearVRAM
	ldy.w #$3C00
	jsl.l QueueClearVRAM
	ldy.w #$5800
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	ldy.w #$3000
	jsl.l QueueClearVRAM
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $02C0
	pea.w $0000
	pea.w $5400
	pea.w $1808
	pea.w TitleMapFill>>16
	pea.w TitleMapFill&$FFFF
	pea.w $02C0
	pea.w $0080
	pea.w $5400
	pea.w $1908
	pea.w TitleMapFill>>16
	pea.w (TitleMapFill+1)&$FFFF
	pea.w $0180
	pea.w $0000
	pea.w $56C0
	pea.w $1809
	pea.w ZeroFillWord>>16
	pea.w ZeroFillWord&$FFFF
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	lda.w #$5420
	sta.b tmp0
	lda.w #$214A
	sta.b tmp1
	ldx.w #TitleLogoMap>>16
	lda.w #TitleLogoMap&$FFFF
	ldy.w #$2A50
	jsl.l MapSetToVRAM
	dec.b QueueBusy
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	pea.w $0020
	pea.w $0010
	ldx.w #TitleLogoMap>>16
	lda.w #TitleLogoMap&$FFFF
	jsr.w GetMapSetPalettePointer
	phx
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	lda.w #$5820
	sta.b tmp0
	lda.w #$0800
	sta.b tmp1
	ldx.w #TitleGoalieMap>>16
	lda.w #TitleGoalieMap&$FFFF
	ldy.w #$0000
	jsl.l MapSetToVRAM
	lda.w #$3820
	sta.b tmp0
	lda.w #$0800
	sta.b tmp1
	ldx.w #TitlePlayersMap>>16
	lda.w #TitlePlayersMap&$FFFF
	ldy.w #$4000
	jsl.l MapSetToVRAM
	sep #$20
	lda.b #$39
	sta.l BG1SC
	lda.b #$59
	sta.l BG2SC
	lda.b #$55
	sta.l BG3SC
	lda.b #$04
	sta.l BG12NBA
	lda.b #$09
	sta.l BGMODE
	lda.b #$17
	sta.l TM
	rep #$20
	ldx.w #$0070
	jsl.l SetupHDMA
	db $00,$0C						; inline parameters: DMAP and BBAD
	dl TitleBG34HDMA				; the HDMA table
	db $7E							; the indirect bank
	lda.w #$8000
	sta.w DMAEnShadow
	jsl.l BlackBackdrop
	jsl.l InitTasks
	lda.w #$0010
	sta.b $7D
	lda.w #$007E
	sta.b a3+2
	lda.b $08
	sta.b d4
	sta.b a3
	clc
	adc.w #$0040
	sta.b d5
	adc.w #$0180
	sta.b $08
	jsl.l MarkWorkBuf
	lda.w #$0010
	sta.b d3
	lda.b d4
	ldy.w #$7FFF
	jsl.l FillWords7E
	ldx.w #TitlePlayersMap>>16
	lda.w #TitlePlayersMap&$FFFF
	jsr.w GetMapSetPalettePointer
	ldy.b d5
	jsl.l StartColourFade
	ldx.w #$007E
	lda.b d4
	ldy.w #$0020
	jsl.l QueueColours16
	lda.w #$0100
	sta.w BG1HScroll
	stz.w BG2HScroll
	ldx.w #TitleWaitForSlide>>16
	lda.w #TitleWaitForSlide
	ldy.w #$0001
	clc
	jsl.l StartTasks
	jsl.l WaitTransfers
	lda.w #$00A3
	jsl.l StartSound
	ldx.w #TitleStartMusicTask>>16
	lda.w #TitleStartMusicTask
	ldy.w #$FF00
	jsl.l AddTask
	inc.w MenuMusicPending
	stz.w fadein
.loop:								; loop: call RunTasks, call AnimateSprites, ...
	jsl.l RunTasks
	jsl.l AnimateSprites
	lda.w TasksDone
	beq .loop
	lda.w #$0058
	sta.l BG1SC
	lda.w #$0051
	sta.l BG2SC
	lda.w #$005C
	sta.l BG3SC
	lda.w #$005C
	sta.l BG4SC
	lda.w #$0002
	sta.l BG12NBA
	lda.w #$0043
	sta.l BG34NBA
	rtl
