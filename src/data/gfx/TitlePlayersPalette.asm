TitlePlayersPalette:				; the title players' colours (16)
	dw TitleGoalieMap-TitlePlayersPalette-2	; the chunk's length
	db 1							; the palette count (not read by the loaders)
	dw 16							; colours per palette
	dw 16							; the colour count
	dw $03E0,$1400,$1800,$2020,$2840,$2C81,$34C2,$3D03
	dw $4565,$49A6,$5207,$5A49,$62AB,$66ED,$6F4F,$7FE0
