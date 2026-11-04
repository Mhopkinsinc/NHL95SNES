ArtRossPicTiles:					; its tiles (82); LZSS stream continues into the next bank
	dw ArtRossPicPalette-ArtRossPicTiles-2	; tiles chunk length
	dw $0052						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0A40						; unpacked tile size
check bankcross off
	incbin "../../../Extracted/segments/bankCA_F000.bin":$ED6..$1000
	incbin "../../../Extracted/segments/bankCB_0000.bin":$0..$88E
