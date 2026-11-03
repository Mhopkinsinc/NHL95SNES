ArrowFontTiles:						; 4bpp tiles, packed: a two colour font, ASCII from the space, with four
									; arrows in place of ^ _ ~ and the last character; the pause menu's
									; (PauseScreenDraw loads it, PrintPauseItemText prints with it)
	dw $0C00						; unpacked size in bytes
	dw $0004						; format 4: literal runs and copies from up to 11 bits back
	incbin "../../../Extracted/segments/bankC0_0000.bin":$282..$83D
