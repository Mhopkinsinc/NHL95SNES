VezinaPicPalette:					; its colours (16)
	dw .end-VezinaPicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$5AD6,$4A52,$35AD,$2529,$35B2,$252D,$1129
	dw $35B2,$0004,$0089,$1089,$7F7F,$5AD6,$4A56,$0000
.end:								; end of the picture
check bankcross full
