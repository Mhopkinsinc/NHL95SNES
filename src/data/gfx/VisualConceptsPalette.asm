VisualConceptsPalette:				; its colours (32)
	dw HighScoreMap-VisualConceptsPalette-2	; the chunk's length
	db 2							; the palette count (not read by the loaders)
	dw 16							; colours per palette
	dw 32							; the colour count
	dw $0000,$0000,$0C63,$1084,$18C6,$2108,$2D6B,$35AD
	dw $3DEF,$4631,$5294,$5AD6,$6318,$6F7B,$77BD,$7FFF
	dw $03E0,$5AD6,$4631,$35AD,$2D6B,$7B18,$7A95,$7E32
	dw $2108,$716C,$18C6,$5CC6,$5064,$1084,$3C00,$3400
