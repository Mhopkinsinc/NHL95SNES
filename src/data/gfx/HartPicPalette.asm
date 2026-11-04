HartPicPalette:						; its colours (16)
	dw .end-HartPicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$7FFF,$6F7B,$35AD,$1084,$35B2,$0004,$3656
	dw $35B2,$4ADB,$5AD6,$2529,$1CE7,$35AD,$4A52,$0000
.end:								; end of the picture
