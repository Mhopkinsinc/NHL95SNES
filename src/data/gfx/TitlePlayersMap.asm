TitlePlayersMap:					; the title screen's front layer (BG1): three players; two other
									; screen setups in bank $C4 load it too
	dw TitlePlayersTiles-TitlePlayersMap-2	; the chunk's length (the bytes after this word)
	db $20,$14						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0500						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_0000.bin":$ABF..$DE6
