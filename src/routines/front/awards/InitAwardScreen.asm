InitAwardScreen:					; prepares the shared awards background, sprites, text map and colour hook
	jsl.l ResetTransferQueues
	jsl.l ResetSprites
	jsl.l ResetWorkBuf
	lda.w #$007F
	sta.b r0+2
	lda.w #$D80A
	sta.b r0
	lda.w #TeamPalettes&$FFFF
	ldx.w #TeamPalettes>>16
	jsl.l Decompress
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	jsl.l ClearNMIHook
	wai
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
	jsl.l MapSetToVRAM
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	jsl.l InitTextMap
	jsl.l WaitTransfers
	lda.w #$8000
	sta.w DMAEnShadow
	sep #$20
	lda.b #$09
	sta.l BGMODE
	lda.b #$1F
	sta.l TM
	lda.b #$03
	sta.l OBSEL
	rep #$20
	stz.w BG2HScroll
	jsl.l RefreshSpritesLong
	lda.w #BlueColoursHook
	ldx.w #BlueColoursHook>>16
	jsl.l SetNMIHook
	rts
