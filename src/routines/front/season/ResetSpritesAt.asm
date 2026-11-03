ResetSpritesAt:						; resets the sprite objects: the slot list (SpriteObjRAM on, $3A bytes
									; each), the palette uses (SpritePalUse) to $FFFF, OAMADDR 0, the sprite
									; tile area from tile $E1 ($DD tiles)
	lda.b $E1
	asl a
	asl a
	asl a
	asl a
	adc.w #$6000
	sta.b $DB
	lda.b $E1
	inc a
	sta.b $E3
	lda.b $DD
	inc a
	sta.b $DF
	lda.w #$3000
	sta.b $D9
	stz.w SpriteCount
	stz.w SpriteFreeCount
	stz.w PalSlotNext
	stz.w PalSlotsUsed
	stz.w SmallTileNext
	stz.w LargeSlotNext
	lda.w #$0000
	sta.l $002102
	lda.w #$FFFF
	ldx.w #$01FE
.loop:								; loop: SpritePalUse,x = A, X - 1, X - 1, ...
	sta.w SpritePalUse,x
	dex
	dex
	bpl .loop
	sta.w SpriteChainTail
	ldx.w #$0000
	ldy.w #$0007
.loop2:								; loop: SpriteList,x = A, X + 1, X + 1, Y - 1, ...
	sta.w SpriteList,x
	inx
	inx
	dey
	bpl .loop2
	clc
	lda.w #SpriteObjRAM
	ldx.w #SpriteFreeList
	ldy.w #$0007
.loop3:								; loop: $00,x = A, X + 1, X + 1, A + $003A, ...
	sta.b $00,x
	inx
	inx
	adc.w #$003A
	dey
	bpl .loop3
	clc
	lda.w #$0007
	ldx.w #$000E
.loop4:								; loop: PalSlotList,x = A, X - 1, X - 1, A - 1, ...
	sta.w PalSlotList,x
	dex
	dex
	dec a
	bpl .loop4
	lda.w #OAMBuf+$1FF
	sta.b $28
	rts
