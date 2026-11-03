PresidentsPicTiles:					; its tiles (34)
	dw PresidentsPicPalette-PresidentsPicTiles-2	; tiles chunk length
	dw $0022						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0440						; unpacked tile size
	incbin "../../../Extracted/segments/bankCE_F000.bin":$150..$3C2
