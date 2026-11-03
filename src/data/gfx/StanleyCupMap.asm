StanleyCupMap:						; the Stanley Cup (rendered), 8 x 14 tiles; StanleyCupScreen loads it
	dw StanleyCupTiles-StanleyCupMap-2	; map chunk length
	db $08,$0E						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00E0						; unpacked map size
	incbin "../../../Extracted/segments/bankCE_F000.bin":$3F0..$4C7
