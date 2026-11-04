EASportsFrame:						; 4 8x8 and 2 16x16 sprites, packed tiles (flags 3)
	db 4,2							; the 8x8 and 16x16 sprite counts
	dw EASportsPieces-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl EASportsTiles				; its tiles
