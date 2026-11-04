LogoPHIFrame:						; 5 8x8 and 6 16x16 sprites, packed tiles (flags 3)
	db 5,6							; the 8x8 and 16x16 sprite counts
	dw LogoPHIPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoPHITiles					; its tiles
