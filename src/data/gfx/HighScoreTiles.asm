HighScoreTiles:						; its tiles (153)
	dw HighScorePalette-HighScoreTiles-2	; the chunk's length
	dw 153							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $1320						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_B000.bin":$D1F..$1000
	incbin "../../../Extracted/segments/bankC2_C000.bin":0..$BA7
