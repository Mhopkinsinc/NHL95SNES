LogoANHFrame:						; 4 8x8 and 8 16x16 sprites, packed tiles (flags 3)
	db 4,8							; the 8x8 and 16x16 sprite counts
	dw LogoANHPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoANHTiles					; its tiles
