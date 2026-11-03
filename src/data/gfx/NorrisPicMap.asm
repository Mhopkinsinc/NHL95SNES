NorrisPicMap:						; the picture of award 6 (AwardPictures): James Norris Memorial Trophy
	dw NorrisPicTiles-NorrisPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankCB_F000.bin":$DDC..$E83
