PauseScreenTiles:					; its tiles (272)
	dw PauseScreenPalette-PauseScreenTiles-2	; the chunk's length
	dw 272							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $2200						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_B000.bin":$E6B..$1000
	incbin "../../../Extracted/segments/bankC1_C000.bin":0..$F9B
