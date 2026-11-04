SetupLinePalette0:					; SetRowPalette0 on the setup screen's current line (row SetupLineRow),
									; then SendTextMap
	lda.w SetupLineRow
SetRowPalette0:						; sets palette 0 on the 64 text map tiles from row A (two rows of 32),
									; then SendTextMap
	xba
	lsr a
	lsr a
	adc.b $D3
	tay
	ldx.w #$003F
.loop:								; loop: A = $0000,y, A and $E3FF, A or $0000, $0000,y = A, ...
	lda.w $0000,y
	and.w #$E3FF
	ora.w #$0000
	sta.w $0000,y
	iny
	iny
	dex
	bpl .loop
	jsl.l SendTextMap
	rts
