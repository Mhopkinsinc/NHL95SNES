TitleGoalieTiles:					; the title goalie's tiles (677)
	dw TitleGoaliePalette-TitleGoalieTiles-2	; the chunk's length
	dw 677							; the tile count (not read by the loaders)
	db $80,$04,$04,$00				; flags (bit 7 packed), the bits per pixel twice (they must match), a zero
	dw $54A0						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_3000.bin":$359..$1000
	incbin "../../../Extracted/segments/bankC2_4000.bin"	; TitleGoalieTiles' stream, continued
	incbin "../../../Extracted/segments/bankC2_5000.bin"	; TitleGoalieTiles' stream, continued
	incbin "../../../Extracted/segments/bankC2_6000.bin"	; TitleGoalieTiles' stream, continued
	incbin "../../../Extracted/segments/bankC2_7000.bin":0..$1CF	; the rest of TitleGoalieTiles' stream
