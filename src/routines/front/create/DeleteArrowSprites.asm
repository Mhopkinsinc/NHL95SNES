DeleteArrowSprites:					; deletes the two arrow sprites a4 and $75 and clears both
	ldx.b a4
	jsl.l DeleteSprite
	stz.b a4
	ldx.b $75
	jsl.l DeleteSprite
	stz.b $75
	rts
