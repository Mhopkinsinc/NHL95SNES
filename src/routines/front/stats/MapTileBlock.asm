MapTileBlock:						; writes 2 rows of 9 tile entries, numbered on from Y, to the VRAM map at
									; X (the second row at X + $20)
	lda.w #$0080
	sta.l VMAIN
	txa
	sta.l VMADDL
	jsl.l WriteNineMapTiles
	tay
	txa
	clc
	adc.w #$0020
	sta.l VMADDL
WriteNineMapTiles:					; write nine consecutive tile entries starting at Y to VMDATAL
	tya
	ldy.w #$0008
.loop:								; loop: VMDATAL = A, A + 1, Y - 1, if the result >= 0 go to .loop, ...
	sta.l VMDATAL
	inc a
	dey
	bpl .loop
	rtl
