PauseScreenPalette:					; its colours (32)
	dw FaceOffMap-PauseScreenPalette-2	; the chunk's length
	db 2							; the palette count (not read by the loaders)
	dw 16							; colours per palette
	dw 32							; the colour count
	dw $7C12,$0000,$7FFF,$7FFB,$777B,$7F76,$62D6,$24E7
	dw $1884,$7ECD,$5252,$3DAD,$7D25,$314A,$7C12,$1042
	dw $7C12,$7FFF,$62D6,$24E7,$1884,$0000,$001B,$27FF
	dw $012C,$4A5F,$1CA5,$1042,$314A,$6C1F,$6C1F,$6C1F
