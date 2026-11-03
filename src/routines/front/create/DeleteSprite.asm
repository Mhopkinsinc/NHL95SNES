DeleteSprite:						; removes the sprite object X: out of the active list, its palette slot
									; released, onto the free list
	lda.w SpriteCount
	bne .1
	rtl
.1:									; A - 1, A * 2, Y = A, A = X
	dec a
	asl a
	tay
	txa
.loop:								; loop: if A = SpriteList,y go to .2, Y - 1, Y - 1, ...
	cmp.w SpriteList,y
	beq .2
	dey
	dey
	bpl .loop
	rtl
.2:									; X = Y, Y = A, call (RemoveSpriteSlotTable,x), A = $0034,y, ...
	tyx
	tay
	jsr (RemoveSpriteSlotTable,x)
	lda.w $0034,y
	and.w #$00FF
	asl a
	tax
	lda.w SpritePalUse,x
	bit.w #$00FF
	bne .3
	xba
	ora.w #$FF00
	sta.w SpritePalUse,x
	and.w #$00FF
	ldx.w PalSlotNext
	dex
	dex
	sta.w PalSlotList,x
	stx.w PalSlotNext
	dec.w PalSlotsUsed
	bra .4
.3:									; A - 1, SpritePalUse,x = A
	dec a
	sta.w SpritePalUse,x
.4:									; X = SpriteFreeCount, X - 1, X - 1, SpriteFreeCount = X, ...
	ldx.w SpriteFreeCount
	dex
	dex
	stx.w SpriteFreeCount
	tya
	sta.w SpriteFreeList,x
	tax
	lda.b $00,x
	bpl .6
	lda.b $02,x
	sta.w SpriteChainTail
	bmi .5
	tay
	lda.w #$FFFF
	sta.w $0000,y
.5:									; A = $12,x, A / 2, A / 2, A / 2, ...
	lda.b $12,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$01FF
	sta.w SmallTileNext
	lda.b $18,x
	sta.w LargeSlotNext
	dec.w SpriteCount
	rtl
.6:									; Y = A, $0018,y = $18,x, $0012,y = $12,x, $0002,y = $02,x, ...
	tay
	lda.b $18,x
	sta.w $0018,y
	lda.b $12,x
	sta.w $0012,y
	lda.b $02,x
	sta.w $0002,y
	tax
	bmi .7
	sty.b $00,x
.7:									; SpriteCount - 1, return
	dec.w SpriteCount
	rtl
