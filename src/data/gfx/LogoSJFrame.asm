LogoSJFrame:						; 6 8x8 and 6 16x16 sprites, packed tiles (flags 3)
	db 6,6							; the 8x8 and 16x16 sprite counts
	dw LogoSJPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoSJTiles					; its tiles
