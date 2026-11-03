HighScoreMap:						; the developer credit: HIGH SCORE PRODUCTIONS AND, shown with
									; VisualConceptsMap
	dw HighScoreTiles-HighScoreMap-2	; the chunk's length (the bytes after this word)
	db $20,$0F						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $03C0						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_B000.bin":$B70..$D15
