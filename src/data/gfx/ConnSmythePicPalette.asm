ConnSmythePicPalette:				; its colours (16)
	dw .end-ConnSmythePicPalette-2	; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$7FFF,$6F7B,$252D,$4A52,$2529,$1084,$0000
	dw $112D,$008D,$1089,$5ADF,$5AD6,$4A52,$35AD,$0000
.end:								; end of the picture
check bankcross full
