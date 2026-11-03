SelkePicTiles:						; its tiles (47); LZSS stream continues into the next bank
	dw SelkePicPalette-SelkePicTiles-2	; tiles chunk length
	dw $002F						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $05E0						; unpacked tile size
check bankcross off
	incbin "../../../Extracted/segments/bankC7_F000.bin":$F6F..$1000
	incbin "../../../Extracted/segments/bankC8_0000.bin":$0..$532
