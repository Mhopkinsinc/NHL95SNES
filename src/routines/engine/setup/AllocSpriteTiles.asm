AllocSpriteTiles:					; takes A sprite tiles from the allocator (SmallTileNext, below $E3) and
									; sets the object's tile base (+$10 / +$12, $6000 + 16 x the first); with
									; no room returns unchanged
	clc
	adc.w SmallTileNext
	cmp.b $E3
	bcc .1
	rts
.1:									; X = SmallTileNext, SmallTileNext = A, A = X, A * 2, ...
	ldx.w SmallTileNext
	sta.w SmallTileNext
	txa
	asl a
	asl a
	asl a
	asl a
	ora.w #$6000
	sta.w $0010,y
	sta.w $0012,y
	rts
