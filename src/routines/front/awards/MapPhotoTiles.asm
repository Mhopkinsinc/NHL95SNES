MapPhotoTiles:						; writes a six by six block of consecutive photo tiles directly to VRAM
	lda.w #$0080
	sta.l VMAIN
	lda.w #$0004
	sta.b d0
	txa
	sta.l VMADDL
.loop:								; loop: call MapPhotoTileRow, Y = A, A = X, A + $0020, ...
	jsr.w MapPhotoTileRow
	tay
	txa
	clc
	adc.w #$0020
	tax
	sta.l VMADDL
	dec.b d0
	bpl .loop
MapPhotoTileRow:					; writes six consecutive tile words to the current VRAM address
	tya
	ldy.w #$0005
.loop:								; loop: VMDATAL = A, A + 1, Y - 1, if the result >= 0 go to .loop, ...
	sta.l VMDATAL
	inc a
	dey
	bpl .loop
	rts
