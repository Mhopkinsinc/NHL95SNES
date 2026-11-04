HartPicMap:							; the picture of award 4 (AwardPictures): Hart Memorial Trophy
	dw HartPicTiles-HartPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankCD_F000.bin":$332..$3B8
