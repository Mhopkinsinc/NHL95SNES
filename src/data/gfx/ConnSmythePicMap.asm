ConnSmythePicMap:					; the picture of award 2 (AwardPictures): Conn Smythe Trophy
	dw ConnSmythePicTiles-ConnSmythePicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankC8_F000.bin":$E40..$EFE
