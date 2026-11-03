CreateSetupArrows:					; creates the setup screen's two arrow sprites (object $1C, animations 1
									; and 2) at x $10, y $79 / $C4, in a4 / $75
	lda.w #$0010
	sta.b $18
	lda.w #$0079
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b a4
	lda.w #$0001
	jsl.l SetSpriteAnim
	lda.w #$00C4
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b $75
	inc.b $38,x
	lda.w #$0002
	jsl.l SetSpriteAnim
	rts
