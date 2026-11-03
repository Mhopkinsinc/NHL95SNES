VezinaPicMap:						; the picture of award 0 (AwardPictures): Vezina Trophy
	dw VezinaPicTiles-VezinaPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../../../Extracted/segments/bankC6_F000.bin":$DEF..$E87
