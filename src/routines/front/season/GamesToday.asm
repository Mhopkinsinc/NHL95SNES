GamesToday:							; League Menu Games Today: the day's games (B marks a game, the pad
									; changes the day, start goes back to the League Menu)
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	lda.w OptPlayMode
	cmp.w #$0003
	bne .1
	jml.l PlayoffBracketScreen
.1:									; A = WonCheckTiles&$FFFF, X = WonCheckTiles>>16, ...
	lda.w #WonCheckTiles&$FFFF
	ldx.w #WonCheckTiles>>16
	jsl.l DecompressUnpackbuf
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0600
	pea.w $0130
	pea.w $007E
	pea.w $50DC
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0070
	pea.w WonCheckPalette>>16
	pea.w WonCheckPalette&$FFFF
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	ldx.w #$0060
	jsl.l SetupHDMA
	db $40,$2C						; inline parameters: DMAP and BBAD
	dl MainScreenHDMA				; the HDMA table
	db $7E							; the indirect bank
	ldx.w #$0050
	jsl.l SetupHDMA
	db $42,$12,$8C,$46,$7E,$7E		; inline parameters
	ldx.w #$0040
	jsl.l SetupHDMA
	db $42,$10						; inline parameters: DMAP and BBAD
	dl BG2ScrollHDMA				; the HDMA table
	db $00							; the indirect bank
	lda.w #$0015
	sta.w ScratchBuf
	lda.w #$0011
	sta.w ScratchBuf+$2
	sta.w ScratchBuf+$4
	lda.w #$001B
	ldx.w #$48FE
	ldy.w #BG3ScrollHDMA
	mvn $7E,$C0
	lda.w #$FFFF
	sta.w BandScroll
	sta.w BandScroll+$2
	sta.w BandScroll+$4
	sta.w BandScroll+$10
	lda.w #$FF2F
	sta.w BandScroll+$8
	lda.w #$FF4F
	sta.w BandScroll+$A
	lda.w #$FF2F
	sta.w BandScroll+$6
	lda.w #$F000
	sta.w DMAEnShadow
	lda.w #$00A7
	sta.b $18
	lda.w #$0046
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b a4
	lda.w #$0001
	jsl.l SetSpriteAnim
	lda.w #$00A4
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b $75
	inc.b $38,x
	lda.w #$0002
	jsl.l SetSpriteAnim
	ldx.b a0
	lda.w #$002D
	sta.b $05,x
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #GamesTodayPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	lda.l SeasonDay
	and.w #$00FF
	sta.b d0
	lda.w #$0002
	sta.b d0+2
	stz.b d2+2
	jsr.w DrawDayGames
	jsr.w PrintGamesTodayDate
	lda.w #$0007
	sta.b d6+2
	stz.w fadestep
	rts
