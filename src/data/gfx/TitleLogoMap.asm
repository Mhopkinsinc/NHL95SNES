TitleLogoMap:						; the title logo (BG3, 2bpp): EA SPORTS presents NHL '95 with the
									; (R) mark (94S TitleLogoTiles)
	dw TitleLogoTiles-TitleLogoMap-2	; the chunk's length (the bytes after this word)
	db $20,$14						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $0500						; the unpacked size
	incbin "../../../Extracted/segments/bankC2_7000.bin":$1FD..$487
