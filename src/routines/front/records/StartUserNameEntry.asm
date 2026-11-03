StartUserNameEntry:					; UserNameEntry's start: fade out, the five sprites at $73-$7B deleted,
									; sprite 28 made (animation 3) for a0
	jsl.l FadeOutWait
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$0008
.loop:								; loop: push Y, X = $73,y, call DeleteSprite, pull Y, ...
	phy
	ldx.b $73,y
	jsl.l DeleteSprite
	ply
	dey
	dey
	bpl .loop
	lda.w #$001C
	jsl.l CreateSprite
	stx.b a0
	lda.w #$0003
	jsl.l SetSpriteAnim
	rts
