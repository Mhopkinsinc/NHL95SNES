PadButtonsMap:						; the instant replay's controller legend: a pad's four buttons (Y, B, X,
									; A) with tape-deck symbols; ReplayMode unpacks it and queues its map,
									; tiles and palette
	dw PadButtonsTiles-PadButtonsMap-2	; the chunk's length (the bytes after this word)
	db $20,$07						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $01C0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_D000.bin":$77F..$81B
