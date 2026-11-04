SelkePicPalette:					; its colours (16)
	dw .end-SelkePicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$0000,$5ADB,$5AD6,$5816,$35AD,$4A52,$35B2
	dw $1089,$2529,$1084,$35B2,$252D,$7F7F,$6F7B,$0000
.end:								; end of the picture
check bankcross full
