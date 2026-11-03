MapTextTiles:						; writes the text map entries of the tiles DrawText made (row Y, the
									; palette bits of $D5)
	lda.b $14
	asl a
	adc.b $D3
	tax
	lda.b tmp3
	lsr a
	lsr a
	lsr a
	sta.b tmp3
	lda.b p0
	sec
	sbc.w #$3000
	lsr a
	lsr a
	lsr a
	adc.b $14
	ora.b $D5
	tay
.loop:								; loop: Y + 1, A = Y, $7E0000,x = A, A = $0E, ...
	iny
	tya
	sta.l $7E0000,x
	lda.b $0E
	lsr a
	bcc .1
	tya
	adc.w #$001F
	sta.l $7E0040,x
.1:									; X + 1, X + 1, tmp3 - 1, if the result is not 0 go to .loop, ...
	inx
	inx
	dec.b tmp3
	bne .loop
	lda.b $0A
	sec
	sbc.b $12
	rtl
