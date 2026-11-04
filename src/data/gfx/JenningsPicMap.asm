JenningsPicMap:						; the picture of award 3 (AwardPictures): William M. Jennings Trophy
	dw JenningsPicTiles-JenningsPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
check bankcross off
	incbin "../../../Extracted/segments/bankC9_F000.bin":$FF2..$1000
	incbin "../../../Extracted/segments/bankCA_0000.bin":$0..$D6
