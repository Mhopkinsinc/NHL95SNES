PlayerPhotosSTL:					; the 6 photos, packed: 48 x 48 pixels each, linear 4bpp (two pixels a
									; byte, 24 bytes a row)
	dw $1B00						; unpacked size in bytes
	dw $0004						; format 4: literal runs and copies from up to 11 bits back
	incbin "../../../Extracted/segments/bankCE_D000.bin":$E8F..$1000
; The PlayerPhotosSTL stream continues from the previous segment.
	incbin "../../../Extracted/segments/bankCE_E000.bin":$0..$1000
	incbin "../../../Extracted/segments/bankCE_F000.bin":$0..$AB
