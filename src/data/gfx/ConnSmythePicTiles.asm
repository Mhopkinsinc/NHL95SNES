ConnSmythePicTiles:					; its tiles (76); LZSS stream continues into the next bank
	dw ConnSmythePicPalette-ConnSmythePicTiles-2	; tiles chunk length
	dw $004C						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0980						; unpacked tile size
check bankcross off
	incbin "../../../Extracted/segments/bankC8_F000.bin":$F08..$1000
	incbin "../../../Extracted/segments/bankC9_0000.bin":$0..$744
