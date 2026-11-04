LinePieceTiles:						; 4bpp tiles, packed: straight and diagonal line pieces and corners;
									; unpacked to RAM before a screen is built from them
	dw $07E0						; unpacked size in bytes
	dw $0006						; format 6: a flag byte per 8 literal runs or copies, up to 11 bits back
	incbin "../../../Extracted/segments/bankC0_4000.bin":$70C..$8E2
