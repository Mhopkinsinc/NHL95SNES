RefTiles:							; its tiles (197)
	dw RefPalette-RefTiles-2		; the chunk's length
	dw 197							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $18A0						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_C000.bin":$F4A..$1000
	incbin "../../../Extracted/segments/bankC2_D000.bin":0..$F14
