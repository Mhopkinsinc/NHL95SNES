ArtRossPicMap:						; the picture of award 5 (AwardPictures): Art Ross Trophy
	dw ArtRossPicTiles-ArtRossPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankCA_F000.bin":$E00..$ECC
