ArtRossPicPalette:					; its colours (16)
	dw .end-ArtRossPicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$7FFF,$1084,$6F7B,$252D,$4A52,$2529,$1089
	dw $112D,$35B2,$1132,$25B6,$5AD6,$35AD,$4AD6,$0000
.end:								; end of the picture
check bankcross full
