RedDotFrame:						; 2 8x8 and 0 16x16 sprites, packed tiles
	db 2,0							; the 8x8 and 16x16 sprite counts
	dw RedDotPieces-SpritePieces	; its pieces
	db 1							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl RedDotTiles					; its tiles
