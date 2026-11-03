RefsMap:							; the ref windows: 7 x 8 tiles per entry, 7 to a row (94S RefsMap);
									; the game screen setup copies them into a map buffer
	dw RefTiles-RefsMap-2			; the chunk's length (the bytes after this word)
	db $31,$18						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0930						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_C000.bin":$C75..$F40
