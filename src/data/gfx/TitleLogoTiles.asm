TitleLogoTiles:						; its tiles (176)
	dw TitleLogoPalette-TitleLogoTiles-2	; the chunk's length
	dw 176							; the tile count (not read by the loaders)
	db $80,$02,$02,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $0B00						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_7000.bin":$491..$90C
