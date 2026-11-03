LogoHFDFrame:						; 0 8x8 and 9 16x16 sprites, packed tiles (flags 2)
	db 0,9							; the 8x8 and 16x16 sprite counts
	dw LogoHFDPieces-SpritePieces	; its pieces
	db 2							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoHFDTiles					; its tiles
