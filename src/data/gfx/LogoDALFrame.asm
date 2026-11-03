LogoDALFrame:						; 10 8x8 and 5 16x16 sprites, packed tiles (flags 3)
	db 10,5							; the 8x8 and 16x16 sprite counts
	dw LogoDALPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoDALTiles					; its tiles
