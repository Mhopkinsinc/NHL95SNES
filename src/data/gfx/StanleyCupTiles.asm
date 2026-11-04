StanleyCupTiles:					; its tiles (87)
	dw StanleyCupPalette-StanleyCupTiles-2	; tiles chunk length
	dw $0057						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0AE0						; unpacked tile size
	incbin "../../../Extracted/segments/bankCE_F000.bin":$4D1..$E50
