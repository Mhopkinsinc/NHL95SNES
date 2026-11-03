VisualConceptsTiles:				; its tiles (101)
	dw VisualConceptsPalette-VisualConceptsTiles-2	; the chunk's length
	dw 101							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $0CA0						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_B000.bin":$286..$B22
