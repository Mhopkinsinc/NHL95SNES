VisualConceptsMap:					; the developer credit: VISUAL CONCEPTS ... PRESENT; one screen
									; setup in bank $C4 loads it and HighScoreMap
	dw VisualConceptsTiles-VisualConceptsMap-2	; the chunk's length (the bytes after this word)
	db $20,$0C						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0300						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_B000.bin":$151..$27C
