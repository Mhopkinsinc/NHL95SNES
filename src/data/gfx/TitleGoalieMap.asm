TitleGoalieMap:						; the title screen's back layer (BG2): a goalie in the crease, the
									; boards and the crowd, 64 x 20 tiles
	dw TitleGoalieTiles-TitleGoalieMap-2	; the chunk's length (the bytes after this word)
	db $40,$14						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0A00						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_2000.bin":$CB9..$1000
	incbin "../../../Extracted/segments/bankC2_3000.bin":0..$34F
