PlayerPhotosQUE:					; the 6 photos, packed: 48 x 48 pixels each, linear 4bpp (two pixels a
									; byte, 24 bytes a row)
	dw $1B00						; unpacked size in bytes
	dw $0004						; format 4: literal runs and copies from up to 11 bits back
	incbin "../../../Extracted/segments/bankCE_B000.bin":$964..$1000
	incbin "../../../Extracted/segments/bankCE_C000.bin":$0..$BDA
