VezinaPicTiles:						; its tiles (59); LZSS stream continues into the next bank
	dw VezinaPicPalette-VezinaPicTiles-2	; tiles chunk length
	dw $003B						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0760						; unpacked tile size
check bankcross off
	incbin "../../../Extracted/segments/bankC6_F000.bin":$E91..$1000
	incbin "../../../Extracted/segments/bankC7_0000.bin":$0..$517
