AllocLargeSpriteTiles:				; takes A large sprite slots from LargeSlotNext (below $DF), sets the
									; object's slot (+$16 / +$18) and VRAM address (+$14, by LargeSlotTiles);
									; with no room the small tiles just taken go back
	clc
	adc.w LargeSlotNext
	cmp.b $DF
	bcc .1
	lda.w #$FF00
	trb.b $10
	lda.w SmallTileNext
	sec
	sbc.b $10
	sbc.b $1E
	sta.w SmallTileNext
	rts
.1:									; X = LargeSlotNext, LargeSlotNext = A, A = X, $0016,y = A, ...
	ldx.w LargeSlotNext
	sta.w LargeSlotNext
	txa
	sta.w $0016,y
	sta.w $0018,y
	asl a
	tax
	lda.l LargeSlotTiles,x
	asl a
	asl a
	asl a
	asl a
	adc.b $DB
	sta.w $0014,y
	rts
