Sample00:							; sound sample 0 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC0_C000.bin":$1CB..$1000
	incbin "../../../Extracted/segments/bankC0_D000.bin":$0..$359
