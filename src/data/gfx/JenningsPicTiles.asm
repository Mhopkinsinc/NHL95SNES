JenningsPicTiles:					; its tiles (95)
	dw JenningsPicPalette-JenningsPicTiles-2	; tiles chunk length
	dw $005F						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0BE0						; unpacked tile size
	incbin "../../../Extracted/segments/bankCA_0000.bin":$E0..$9B2
