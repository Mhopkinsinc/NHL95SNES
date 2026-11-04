ControllerSetupScreen:				; builds the controller setup screen: a sprite for each pad and the
									; Controller Setup page
	ldx.b a0
	jsl.l DeleteSprite
	ldx.b a4
	jsl.l DeleteSprite
	ldx.b $75
	jsl.l DeleteSprite
	jsr.w RefreshSprites
	lda.w #$0003
	sta.b $1E
	inc.b $20
	lda.w #$0080
	sta.b $18
	lda.w #$00C8
	sta.b $1A
	ldy.w #$0008
.loop:								; loop: push Y, A = $001D, call CreateSprite, pull Y, ...
	phy
	lda.w #$001D
	jsl.l CreateSprite
	ply
	stx.b $73,y
	lda.b $1A
	sbc.w #$000F
	sta.b $1A
	tya
	lsr a
	jsl.l SetSpriteAnim
	dey
	dey
	bpl .loop
	stz.b $1E
	stz.b $20
	lda.b $D3
	ldy.w #$0340
	jsl.l ClearRAM7E
	clc
	lda.b $D3
	adc.w #$03C0
	ldy.w #$0340
	jsl.l ClearRAM7E
	lda.w #ControllerSetupPage&$FFFF
	jsl.l PrintTextPage
	lda.w #$0005
	sta.w fadein
	rts
