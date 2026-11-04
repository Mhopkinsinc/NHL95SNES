FaceOffTiles:						; its tiles (78)
	dw FaceOffPalette-FaceOffTiles-2	; the chunk's length
	dw 78							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $09C0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_D000.bin":$1C7..$751
