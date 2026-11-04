LogoOTWFrame:						; 7 8x8 and 6 16x16 sprites, packed tiles (flags 3)
	db 7,6							; the 8x8 and 16x16 sprite counts
	dw LogoOTWPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoOTWTiles					; its tiles
