IceRinkTiles:						; its tiles (520), LZSS; the stream continues in the next bank
	dw IceRinkPalette-IceRinkTiles-2	; tiles chunk length
	dw $0208						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $4100						; unpacked tile size
	incbin "../../../Extracted/segments/bankCC_F000.bin":$E40..$1000
org $CD0000
	incbin "../../../Extracted/segments/bankCD_0000.bin":$0..$1000
; The IceRinkTiles stream continues from the previous segment.
	incbin "../../../Extracted/segments/bankCD_1000.bin":$0..$1000
	incbin "../../../Extracted/segments/bankCD_2000.bin":$0..$559
