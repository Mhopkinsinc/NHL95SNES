PlayoffBracketTiles:				; its tiles (106)
	dw PlayoffBracketPalette-PlayoffBracketTiles-2	; the chunk's length
	dw 106							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $0D40						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_E000.bin":$65..$98B
