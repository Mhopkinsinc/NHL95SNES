PresidentsPicPalette:				; its colours (16)
	dw .end-PresidentsPicPalette-2	; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$0000,$5AD6,$6F7B,$35AD,$4A52,$35B2,$252D
	dw $6318,$1129,$1089,$0084,$2529,$6F7F,$7FFF,$0000
.end:								; end of the picture
