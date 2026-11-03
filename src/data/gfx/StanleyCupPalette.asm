StanleyCupPalette:					; its colours (16)
	dw .end-StanleyCupPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $27E0,$3529,$1084,$5A52,$2CE7,$1000,$2484,$6ED6
	dw $5A52,$49AD,$49B2,$2529,$7F7B,$0000,$5AD6,$6F7B
.end:								; end of the map set
	padbyte $00						; unused to the end of the bank
	pad $CF0000
