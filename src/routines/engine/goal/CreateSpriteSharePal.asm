CreateSpriteSharePal:				; CreateSprite, sharing the palette slot of the object in Y
	sta.b $10
	lda.w SpriteCount
	inc a
	cmp.w #$0009
	bcc .1
	rtl
.1:									; $1C = Y, SpriteCount = A, A - 1, A * 2, ...
	sty.b $1C
	sta.w SpriteCount
	dec a
	asl a
	tay
	ldx.w SpriteFreeCount
	lda.w SpriteFreeList,x
	inx
	inx
	stx.w SpriteFreeCount
	sta.w SpriteList,y
	tax
	lda.b $18
	sta.b $05,x
	lda.b $1A
	sta.b $08,x
	lda.b $10
	sta.b $24,x
	lda.w #$0100
	sta.b $0A,x
	sta.b $0C,x
	sta.b $0E,x
	lda.b $D9
	sta.b $36,x
	stz.b $30,x
	stz.b $1E,x
	stz.b $38,x
	stz.b $20,x
	stz.b $34,x
	lda.w #$FFFF
	sta.b $28,x
	sta.b $2A,x
	sta.b $2C,x
	sta.b $00,x
	sta.b $22,x
	lda.b $10
	asl a
	adc.l $008000
	txy
	tax
	lda.b $00,x
	tax
	lda.b $09,x
	and.w #$00FF
	lda.b $00,x
	sta.w $0026,y
	lda.b $04,x
	lda.b $05,x
	lda.b $02,x
	sta.w $002E,y
	stx.b $10
	tax
	lda.b $00,x
	sta.w $0032,y
	ldx.b $10
	lda.b $07,x
	sta.b $10
	ldx.b $1C
	lda.b $34,x
	sta.w $0034,y
	and.w #$00FF
	asl a
	tax
	inc.w SpritePalUse,x
	lda.b $10
	and.w #$00FF
	clc
	adc.b $1E
	sta.w $001A,y
	jsr.w AllocSpriteTiles
	bcs .3
	lda.b $10
	xba
	and.w #$00FF
	adc.b $20
	sta.w $001C,y
	jsr.w AllocLargeSpriteTiles
	bcs .4
	ldx.w SpriteChainTail
	bmi .2
	sty.b $00,x
.2:									; A = X, X = Y, $02,x = A, SpriteChainTail = X, ...
	txa
	tyx
	sta.b $02,x
	stx.w SpriteChainTail
	rtl
.3:									; A = $10, A and $00FF, A + $20, $001C,y = A
	lda.b $10
	xba
	and.w #$00FF
	clc
	adc.b $20
	sta.w $001C,y
.4:									; if SpriteChainTail >= 0 go to .loop
	ldx.w SpriteChainTail
	bpl .loop
	brk #$00						; a brk in the ROM, between routines
.5:									; A / 2, A / 2, A / 2, A / 2, ...
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w $001A,y
	bcc .7
	lda.b $16,x
	sbc.b $18,x
	cmp.w $001C,y
	bcc .7
	lda.b $12,x
	sta.w $0010,y
	sta.w $0012,y
	lda.w $001A,y
	asl a
	asl a
	asl a
	asl a
	adc.w $0010,y
	sta.b $12,x
	lda.b $18,x
	sta.w $0016,y
	sta.w $0018,y
	clc
	adc.w $001C,y
	sta.b $18,x
	lda.b $02,x
	sta.w $0002,y
	sty.b $02,x
	txa
	tyx
	sta.w $0000,y
	lda.b $02,x
	bmi .6
	tay
	txa
	sta.w $0000,y
	tay
.6:									; A = $16,x, A * 2, X = A, A = LargeSlotTiles,x, ...
	lda.b $16,x
	asl a
	tax
	lda.l LargeSlotTiles,x
	asl a
	asl a
	asl a
	asl a
	adc.b $DB
	tyx
	sta.b $14,x
	clc
	rtl
.loop:								; loop: A = $10,x, A - $12,x, if the result is not 0 go to .5, ...
	sec
	lda.b $10,x
	sbc.b $12,x
	bne .5
	sec
	lda.b $16,x
	sbc.b $18,x
	bne .5
.7:									; A = $02,x, X = A, if the result >= 0 go to .loop, A = $0034,y, ...
	lda.b $02,x
	tax
	bpl .loop
	lda.w $0034,y
	and.w #$00FF
	asl a
	tax
	lda.w SpritePalUse,x
	bit.w #$00FF
	bne .8
	lda.w #$FFFF
	sta.w SpritePalUse,x
	lda.w PalSlotNext
	dec a
	dec a
	sta.w PalSlotNext
	dec.w PalSlotsUsed
	bra .9
.8:									; A - 1, SpritePalUse,x = A
	dec a
	sta.w SpritePalUse,x
.9:									; SpriteFreeCount - 1, SpriteFreeCount - 1, SpriteCount - 1, ...
	dec.w SpriteFreeCount
	dec.w SpriteFreeCount
	dec.w SpriteCount
	lda.w SpriteCount
	asl a
	tax
	lda.w #$FFFF
	sta.w SpriteList,x
	sec
	rtl
