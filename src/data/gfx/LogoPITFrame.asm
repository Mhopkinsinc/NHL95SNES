LogoPITFrame:						; 6 8x8 and 5 16x16 sprites, packed tiles (flags 3)
	db 6,5							; the 8x8 and 16x16 sprite counts
	dw LogoPITPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoPITTiles					; its tiles
