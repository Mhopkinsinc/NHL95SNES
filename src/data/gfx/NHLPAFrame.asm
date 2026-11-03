NHLPAFrame:							; 10 8x8 and 4 16x16 sprites, packed tiles (flags 3)
	db 10,4							; the 8x8 and 16x16 sprite counts
	dw NHLPAPieces-SpritePieces		; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl NHLPATiles					; its tiles
