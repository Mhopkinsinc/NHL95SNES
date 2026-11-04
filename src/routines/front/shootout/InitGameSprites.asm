InitGameSprites:					; resets the sprites, creates sprite record $1D (with the allocators at
									; $56 / $45), then the home and away team palettes (HomeSpritePal /
									; VisSpritePal) and palettes $B8 / $B9 (UseSpritePalette)
	jsl.l ResetSprites
	stz.b $20
	stz.b $1E
	lda.w #$001D
	jsl.l CreateSpriteSharePal
	lda.w #$FFFF
	sta.b $0A,x
	lda.w #$0056
	sta.b $1A,x
	sta.w SmallTileNext
	lda.w #$0045
	sta.b $1C,x
	sta.w LargeSlotNext
	lda.w HomeTeam
	asl a
	adc.w #$0081
	sta.w HomeSpritePal
	jsl.l UseSpritePalette
	lda.w VisTeam
	asl a
	adc.w #$0080
	sta.w VisSpritePal
	jsl.l UseSpritePalette
	lda.w #$00B8
	jsl.l UseSpritePalette
	lda.w #$00B9
	jsl.l UseSpritePalette
	jsl.l ResetWorkBuf
	rts
