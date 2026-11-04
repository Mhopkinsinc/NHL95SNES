SelkePicMap:						; the picture of award 1 (AwardPictures): Frank J. Selke Trophy
	dw SelkePicTiles-SelkePicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankC7_F000.bin":$E85..$F65
