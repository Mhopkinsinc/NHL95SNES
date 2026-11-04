SetupScreen:						; common start of the stats screens: the tiled background, VRAM cleared,
									; the colour hook, a new text map (InitTextMap) and the sprites
	stz.w DMAEnShadow
	stz.b $22
	stz.b $24
	lda.w #$00D7
	sta.b $18
	lda.w #$00D0
	sta.b $1A
	lda.w #$0020
	jsl.l CreateSprite
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
	jsr.w MapSetToVRAMBody
	ldy.w #$5000
	jsl.l ClearVRAM
	ldy.w #$5400
	jsl.l ClearVRAM
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	lda.w #BlueColoursHook&$FFFF
	ldx.w #BlueColoursHook>>16
	jsl.l SetNMIHook
	jsl.l InitTextMap
	lda.w #$8000
	sta.w DMAEnShadow
	lda.w #$001F
	sta.l TM
	lda.w #$0240
	jsl.l AllocWorkBuf
	sta.b r0
	sta.b r2
	lda.w #$007E
	sta.b r0+2
	ldx.w #GradientBarTiles>>16
	lda.w #GradientBarTiles&$FFFF
	jsl.l Decompress
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0240
	pea.w $0010
	pea.w $007E
	pei ($34)
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsr.w QueueHomePalette
	jsr.w QueueVisPalette
	jsl.l WaitTransfers
	lda.w #$0240
	jsl.l FreeWorkBuf
	lda.w #$0002
	sta.w BG2VScroll
	rts
