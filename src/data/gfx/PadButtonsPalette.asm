PadButtonsPalette:					; its colours (16)
	dw PlayoffBracketMap-PadButtonsPalette-2	; the chunk's length
	db 1							; the palette count (not read by the loaders)
	dw 16							; colours per palette
	dw 16							; the colour count
	dw $7FFF,$7FBD,$7FBA,$6F7B,$0000,$5AD6,$35AD,$2529
	dw $5ADB,$4A5F,$353B,$6E4D,$12DB,$7ED2,$1084,$7F72
