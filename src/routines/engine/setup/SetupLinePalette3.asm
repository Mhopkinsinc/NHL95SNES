SetupLinePalette3:					; SetRowPalette3 on the setup screen's current line (row SetupLineRow);
									; GameSetUp calls it before the cursor moves
	lda.w SetupLineRow
SetRowPalette3:						; sets palette 3 on the 64 text map tiles from row A (two rows of 32)
	xba
	lsr a
	lsr a
	adc.b $D3
	tay
	ldx.w #$003F
.loop:								; loop: A = $0000,y, A and $E3FF, A or $0C00, $0000,y = A, ...
	lda.w $0000,y
	and.w #$E3FF
	ora.w #$0C00
	sta.w $0000,y
	iny
	iny
	dex
	bpl .loop
	rts
