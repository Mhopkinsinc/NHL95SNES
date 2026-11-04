DigitFontTiles:						; 4bpp tiles, packed: the digits and the position letters D, L, C, R, X;
									; unpacked and sent to VRAM
	dw $01E0						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../../../Extracted/segments/bankC0_4000.bin":$646..$708
