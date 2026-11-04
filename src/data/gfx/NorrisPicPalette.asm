NorrisPicPalette:					; its colours (16)
	dw .end-NorrisPicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$6F7B,$5ADB,$5AD6,$5AD6,$35B2,$0004,$252D
	dw $0084,$4A52,$35AD,$2529,$25AD,$1084,$1129,$0000
.end:								; end of the picture
check bankcross full
