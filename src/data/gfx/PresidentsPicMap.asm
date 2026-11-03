PresidentsPicMap:					; the picture of award 7 (AwardPictures): Presidents Trophy
	dw PresidentsPicTiles-PresidentsPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankCE_F000.bin":$B2..$146
