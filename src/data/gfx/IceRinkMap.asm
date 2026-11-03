IceRinkMap:							; the rink, 32 x 170 tiles (both halves); setupice loads it
	dw IceRinkTiles-IceRinkMap-2	; map chunk length
	db $20,$AA						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $2A80						; unpacked map size
	incbin "../../../Extracted/segments/bankCC_E000.bin":$EAC..$1000
	incbin "../../../Extracted/segments/bankCC_F000.bin":$0..$E36
