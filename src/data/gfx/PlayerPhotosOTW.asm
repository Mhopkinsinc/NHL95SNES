PlayerPhotosOTW:					; the 6 photos, packed: 48 x 48 pixels each, linear 4bpp (two pixels a
									; byte, 24 bytes a row)
	dw $1B00						; unpacked size in bytes
	dw $0004						; format 4: literal runs and copies from up to 11 bits back
	incbin "../../../Extracted/segments/bankCE_8000.bin":$14B..$1000
	incbin "../../../Extracted/segments/bankCE_9000.bin":$0..$3D3
