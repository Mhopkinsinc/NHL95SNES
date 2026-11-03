RatingRowPalette3:					; palette 3 on the 32 tiles of row A + d6 (the rating row the cursor
									; leaves)
	clc
	adc.b d6
	xba
	lsr a
	lsr a
	adc.b $D3
	tax
	ldy.w #$001F
.loop:								; loop: A = $7E0000,x, A and $E3FF, A or $0C00, $7E0000,x = A, ...
	lda.l $7E0000,x
	and.w #$E3FF
	ora.w #$0C00
	sta.l $7E0000,x
	inx
	inx
	dey
	bpl .loop
RatingRowPalette3Return:			; the rts RatingRowPalette3 ends with, shared by SkaterRatingsInput
	rts
