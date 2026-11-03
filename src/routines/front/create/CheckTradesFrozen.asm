CheckTradesFrozen:					; returns when trading is open; when its save RAM flag is set: the Alert
									; All player trading has been frozen until the new season begins
									; (ShowAlert)
	lda.l SRPODay
	and.w #$00FF
	bne .1
	rtl
.1:									; continue
	pea.w $54B1
ShowAlert:							; prints the Alert page on the stack, waits for start / select, then goes
									; back to the setup screen (GameSetUp)
	jsl.l FadeOutWait
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	lda.w #$FFFF
	sta.w BG3VScroll
	jsl.l WaitTransfers
	ldx.b d7
	jsl.l DeleteSprite
	stz.b d7
	ldx.b d7+2
	jsl.l DeleteSprite
	stz.b d7+2
	jsl.l DeleteArrowSpritesLong
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	pla
	jsl.l PrintTextPage
	ldx.b a0
	lda.w #$FF80
	sta.b $05,x
	sta.b $08,x
	stz.w fadestep
	stz.w repeatdelayframes
	stz.w padchangeany
.loop:								; loop: call UpdateMenuSpritesTwice, call ReadMenuPads, ...
	jsl.l UpdateMenuSpritesTwice
	jsl.l ReadMenuPads
	lda.w repeatdelayframes
	bne .loop
	lda.w padchangeany
	bit.w #$3000
	beq .loop
	jsl.l FadeOutWait
	phb
	pla
	pla
	jml.l GameSetUp
