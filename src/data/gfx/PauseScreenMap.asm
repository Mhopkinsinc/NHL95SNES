PauseScreenMap:						; the pause screen: the Info / Stats / Options tabs, the periods,
									; both penalty boxes, dot-matrix digits; a screen setup in bank $C5
									; loads it into a WRAM buffer
	dw PauseScreenTiles-PauseScreenMap-2	; the chunk's length (the bytes after this word)
	db $20,$23						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $08C0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_B000.bin":$A38..$E61
