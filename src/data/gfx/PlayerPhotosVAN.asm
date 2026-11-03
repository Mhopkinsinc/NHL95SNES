PlayerPhotosVAN:					; the 6 photos, packed: 48 x 48 pixels each, linear 4bpp (two pixels a
									; byte, 24 bytes a row)
	dw $1B00						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../../../Extracted/segments/bankC0_6000.bin":$F31..$1000
	incbin "../../../Extracted/segments/bankC0_7000.bin":0..$ECB
