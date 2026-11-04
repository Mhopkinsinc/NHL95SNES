BlackBoxTiles:						; a black box with a white frame: 1 8x8 + 15 16x16 sprites, packed
	incbin "../../../Extracted/segments/bankC1_8000.bin":$FD3..$1000
	incbin "../../../Extracted/segments/bankC1_9000.bin":$0..$84
