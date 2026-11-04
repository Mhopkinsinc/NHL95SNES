PlayoffBracketMap:					; the playoff bracket with the Stanley Cup, 100 x 28 tiles (94S
									; PlayoffBracketMap); code in bank $C4 unpacks it to unpackbuf
	dw PlayoffBracketTiles-PlayoffBracketMap-2	; the chunk's length (the bytes after this word)
	db $64,$1C						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $15E0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_D000.bin":$C82..$1000
	incbin "../../../Extracted/segments/bankC1_E000.bin":0..$5B
