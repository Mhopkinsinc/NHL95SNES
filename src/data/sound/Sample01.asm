Sample01:							; sound sample 1 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC0_B000.bin":$E7A..$1000
	incbin "../../../Extracted/segments/bankC0_C000.bin":$0..$1CB
