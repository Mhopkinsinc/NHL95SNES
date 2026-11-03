LogoDETFrame:						; 11 8x8 and 4 16x16 sprites, packed tiles (flags 3)
	db 11,4							; the 8x8 and 16x16 sprite counts
	dw LogoDETPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoDETTiles					; its tiles
