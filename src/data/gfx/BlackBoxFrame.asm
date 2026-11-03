BlackBoxFrame:						; 1 8x8 and 15 16x16 sprites, packed tiles (flags 3)
	db 1,15							; the 8x8 and 16x16 sprite counts
	dw BlackBoxPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl BlackBoxTiles				; its tiles
