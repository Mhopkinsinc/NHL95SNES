HartPicTiles:						; its tiles (49)
	dw HartPicPalette-HartPicTiles-2	; tiles chunk length
	dw $0031						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0620						; unpacked tile size
	incbin "../../../Extracted/segments/bankCD_F000.bin":$3C2..$923
