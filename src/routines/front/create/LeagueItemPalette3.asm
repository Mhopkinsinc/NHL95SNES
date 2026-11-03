LeagueItemPalette3:					; palette 3 on League Menu item d6 (LeagueItemPalette with $0C00)
	lda.w #$0C00
	sta.b tmp0
LeagueItemPalette:					; puts palette bits tmp0 on the 64 tiles of League Menu item d6 (from row
									; d6 * 3 + 6)
	lda.b d6
	asl a
	adc.b d6
	xba
	lsr a
	lsr a
	adc.b $D3
	tax
	ldy.w #$003F
.loop:								; loop: A = $0180,x, A and $E3FF, A or tmp0, $0180,x = A, ...
	lda.w $0180,x
	and.w #$E3FF
	ora.b tmp0
	sta.w $0180,x
	inx
	inx
	dey
	bpl .loop
	rts
