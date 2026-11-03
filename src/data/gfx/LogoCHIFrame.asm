LogoCHIFrame:						; 4 8x8 and 7 16x16 sprites, packed tiles (flags 3)
	db 4,7							; the 8x8 and 16x16 sprite counts
	dw LogoCHIPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl LogoCHITiles					; its tiles
