JenningsPicPalette:					; its colours (16)
	dw .end-JenningsPicPalette-2	; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$5AD6,$4A56,$4A52,$35AD,$2529,$35B2,$2529
	dw $252D,$1084,$0000,$1089,$6F7B,$7FFF,$5AD6,$0000
.end:								; end of the picture
check bankcross full
