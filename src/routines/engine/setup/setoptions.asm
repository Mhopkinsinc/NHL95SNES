setoptions:							; builds the game setup screen: its graphics and HDMA, then the Game Setup
									; page
	jsl.l SeedRandom
	jsl.l FadeOutWait
	lda.w #$0001
	sta.w mp5readall
	jsl.l ResetTransferQueues
	jsl.l ResetWorkBuf
	lda.w #$007F
	sta.b r0+2
	lda.w #$D80A
	sta.b r0
	lda.w #TeamPalettes&$FFFF
	ldx.w #TeamPalettes>>16
	jsl.l Decompress
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$0000
	jsl.l QueueClearVRAM
	jsl.l WaitTransfers
	lda.w #GradientBarTiles&$FFFF
	ldx.w #GradientBarTiles>>16
	jsl.l DecompressUnpackbuf
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0240
	pea.w $0010
	pea.w $007E
	pea.w $50DC
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	stz.w DMAEnShadow
	jsl.l WaitTransfers
	ldx.w #$0070
	jsl.l SetupHDMA
	db $03,$21						; inline parameters: DMAP and BBAD
	dl MenuGradientHDMA				; the HDMA table
	db $00							; the indirect bank
	ldx.w #$0060
	jsl.l SetupHDMA
	db $42,$12,$8C,$46,$7E,$7E		; inline parameters
	jsr.w InitSetupScroll
	lda.w #$0400
	sta.b tmp1
	lda.w #$5800
	sta.b tmp0
	lda.w #MenuBackMap&$FFFF
	ldx.w #MenuBackMap>>16
	ldy.w #$2000
	jsr.w MapSetToVRAMBody
	sep #$20
	pea.w $7E80
	plb
	lda.b #$17
	sta.w TM
	lda.b #$09
	sta.w BGMODE
	lda.b #$03
	sta.w OBSEL
	plb
	rep #$20
	lda.w #$3100
	sta.b tmp2
	lda.w #$3000
	sta.b tmp1
	dec.b QueueBusy
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	pea.w $0020
	pea.w $0080
	pea.w AwayUniformPalettes>>16
	pea.w AwayUniformPalettes&$FFFF
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	jsl.l InitTextMap
	lda.w #GameSetupPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	lda.w #BlueColoursHook&$FFFF
	ldx.w #BlueColoursHook>>16
	jsl.l SetNMIHook
	jsl.l ResetSprites
	jsr.w DrawSetupTeams
	lda.w #$0008
	sta.b $18
	lda.w #$008C
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b a0
	jsr.w CreateSetupArrows
	lda.w #$00D7
	sta.b $18
	lda.w #$00D0
	sta.b $1A
	lda.w #$0020
	jsl.l CreateSprite
	jsr.w DrawPlayModeOptions
	jsl.l WaitTransfers
	lda.w #$C000
	sta.w DMAEnShadow
	lda.w #BracketSeriesMarks&$FFFF
	ldy.w #$0078
	jsl.l ClearRAM7E
	jsl.l UpdateMenuSpritesTwice
	rts
