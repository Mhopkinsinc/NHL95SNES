FaceOffMap:							; the faceoff box: 4 frames of 12 x 10 tiles, the referee dropping
									; the puck (94S FaceOffMap)
	dw FaceOffTiles-FaceOffMap-2	; the chunk's length (the bytes after this word)
	db $20,$28						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0A00						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_C000.bin":$FE9..$1000
	incbin "../../../Extracted/segments/bankC1_D000.bin":0..$1BD
