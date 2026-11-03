ExitPlayoffBracket:					; leaves the playoff bracket for the League Menu (SeasonOptions): the
									; screen reset for it
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	jsl.l WaitTransfers
	ldx.w #$0070
	jsl.l SetupHDMA
	db $03,$21						; inline parameters: DMAP and BBAD
	dl MenuGradientHDMA				; the HDMA table
	db $00							; the indirect bank
	lda.w #BlueColoursHook&$FFFF
	ldx.w #BlueColoursHook>>16
	jsl.l SetNMIHook
	jsl.l ResetSprites
	lda.w #$001C
	jsl.l CreateSprite
	stx.b a0
	lda.w #$00D7
	sta.b $18
	lda.w #$00D0
	sta.b $1A
	lda.w #$0020
	jsl.l CreateSprite
	phd
	lda.w #$2100
	tcd
	stz.b W12SEL&$FF
	stz.b WOBJSEL&$FF
	stz.b WBGLOG&$FF
	stz.b TMW&$FF
	stz.b CGWSEL&$FF
	pld
	stz.w BG2HScroll
	ldy.w #$0000
	jsl.l QueueClearVRAM
	ldy.w #$5000
	jsl.l ClearVRAM
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
	jsl.l WaitTransfers
	stz.w fadestep
	jml.l SeasonOptions
