NorrisPicTiles:						; its tiles (66); LZSS stream continues into the next bank
	dw NorrisPicPalette-NorrisPicTiles-2	; tiles chunk length
	dw $0042						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0840						; unpacked tile size
check bankcross off
	incbin "../../../Extracted/segments/bankCB_F000.bin":$E8D..$1000
	incbin "../../../Extracted/segments/bankCC_0000.bin":$0..$5BE
