FaceOffPalette:						; its colours (16)
	dw PadButtonsMap-FaceOffPalette-2	; the chunk's length
	db 1							; the palette count (not read by the loaders)
	dw 16							; colours per palette
	dw 16							; the colour count
	dw $0240,$0000,$318C,$4E73,$6739,$4A5B,$35B6,$5AD6
	dw $7FFF,$739C,$7FB8,$012D,$0089,$2108,$025B,$7ED2
