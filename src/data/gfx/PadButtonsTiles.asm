PadButtonsTiles:					; its tiles (53)
	dw PadButtonsPalette-PadButtonsTiles-2	; the chunk's length
	dw 53							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $06A0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_D000.bin":$825..$C54
